// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import { LRTConfigTest, ILRTConfig, LRTConstants, UtilLib } from "./LRTConfigTest.t.sol";
import { IStrategy } from "src/interfaces/IStrategy.sol";
import { NodeDelegator } from "src/NodeDelegator.sol";
import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

contract MockEigenStrategyManager {
    mapping(address depositor => mapping(address strategy => uint256 shares)) public depositorStrategyShareBalances;

    address[] public strategies;

    function depositIntoStrategy(IStrategy strategy, IERC20 token, uint256 amount) external returns (uint256 shares) {
        token.transferFrom(msg.sender, address(strategy), amount);

        shares = amount;

        depositorStrategyShareBalances[msg.sender][address(strategy)] += shares;

        strategies.push(address(strategy));

        return shares;
    }

    function getDeposits(address depositor) external view returns (IStrategy[] memory, uint256[] memory) {
        uint256[] memory shares = new uint256[](strategies.length);
        IStrategy[] memory strategies_ = new IStrategy[](strategies.length);

        for (uint256 i = 0; i < strategies.length; i++) {
            strategies_[i] = IStrategy(strategies[i]);
            shares[i] = depositorStrategyShareBalances[depositor][strategies[i]];
        }

        return (strategies_, shares);
    }
}

contract MockStrategy {
    IERC20 public underlyingToken_;
    uint256 public mockUserUnderlyingViewBal;

    constructor(address _underlyingToken, uint256 _mockUserUnderlyingViewBal) {
        underlyingToken_ = IERC20(_underlyingToken);

        mockUserUnderlyingViewBal = _mockUserUnderlyingViewBal;
    }

    function underlyingToken() external view returns (IERC20) {
        return underlyingToken_;
    }

    function userUnderlyingView(address) external view returns (uint256) {
        return mockUserUnderlyingViewBal;
    }
}

contract NodeDelegatorTest is LRTConfigTest {
    NodeDelegator public nodeDel;

    MockEigenStrategyManager public mockEigenStrategyManager;

    MockStrategy public rETHMockStrategy;
    MockStrategy public cbETHMockStrategy;
    address public mockLRTDepositPool;

    event UpdatedLRTConfig(address indexed lrtConfig);
    event AssetDepositIntoStrategy(address indexed asset, address indexed strategy, uint256 depositAmount);

    uint256 public mockUserUnderlyingViewBalance;

    function setUp() public virtual override {
        super.setUp();

        // initialize LRTConfig
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        // add mockEigenStrategyManager to LRTConfig
        mockEigenStrategyManager = new MockEigenStrategyManager();
        vm.startPrank(admin);
        lrtConfig.setContract(LRTConstants.EIGEN_STRATEGY_MANAGER, address(mockEigenStrategyManager));

        // add manager role
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);

        // add mockStrategy to LRTConfig
        mockUserUnderlyingViewBalance = 10 ether;
        rETHMockStrategy = new MockStrategy(address(rETH), mockUserUnderlyingViewBalance);
        cbETHMockStrategy = new MockStrategy(address(cbETH), mockUserUnderlyingViewBalance);

        lrtConfig.updateAssetStrategy(address(rETH), address(rETHMockStrategy));
        lrtConfig.updateAssetStrategy(address(cbETH), address(cbETHMockStrategy));

        // add mockLRTDepositPool to LRTConfig
        mockLRTDepositPool = makeAddr("mockLRTDepositPool");
        lrtConfig.setContract(LRTConstants.LRT_DEPOSIT_POOL, mockLRTDepositPool);
        vm.stopPrank();

        // deploy NodeDelegator
        ProxyAdmin proxyAdmin = new ProxyAdmin();
        NodeDelegator nodeDelImpl = new NodeDelegator();
        TransparentUpgradeableProxy nodeDelProxy = new TransparentUpgradeableProxy(
            address(nodeDelImpl),
            address(proxyAdmin),
            ""
        );

        nodeDel = NodeDelegator(address(nodeDelProxy));
    }
}

contract NodeDelegatorInitialize is NodeDelegatorTest {
    function test_RevertInitializeIfAlreadyInitialized() external {
        nodeDel.initialize(address(lrtConfig));

        vm.startPrank(admin);
        // cannot initialize again
        vm.expectRevert("Initializable: contract is already initialized");
        nodeDel.initialize(address(lrtConfig));
        vm.stopPrank();
    }

    function test_RevertInitializeIfLRTConfigIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        nodeDel.initialize(address(0));
        vm.stopPrank();
    }

    function test_SetInitializableValues() external {
        expectEmit();
        emit UpdatedLRTConfig(address(lrtConfig));
        nodeDel.initialize(address(lrtConfig));

        assertEq(address(nodeDel.lrtConfig()), address(lrtConfig));
    }
}

contract NodeDelegatorMaxApproveToEigenStrategyManager is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDel.maxApproveToEigenStrategyManager(address(rETH));
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAddress = address(0x123);
        vm.startPrank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        nodeDel.maxApproveToEigenStrategyManager(randomAddress);
        vm.stopPrank();
    }

    function test_MaxApproveToEigenStrategyManager() external {
        vm.startPrank(manager);
        nodeDel.maxApproveToEigenStrategyManager(address(rETH));
        vm.stopPrank();

        // check that the nodeDelegator has max approved the eigen strategy manager
        assertEq(rETH.allowance(address(nodeDel), address(mockEigenStrategyManager)), type(uint256).max);
    }
}

contract NodeDelegatorDepositAssetIntoStrategy is NodeDelegatorTest {
    uint256 public amountDeposited;

    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));

        // sends token to nodeDelegator so it can deposit it into the strategy
        amountDeposited = 10 ether;
        vm.prank(bob);
        rETH.transfer(address(nodeDel), amountDeposited);

        // max approve nodeDelegator to deposit into strategy
        vm.prank(manager);
        nodeDel.maxApproveToEigenStrategyManager(address(rETH));
    }

    function test_RevertWhenContractIsPaused() external {
        vm.startPrank(manager);
        nodeDel.pause();

        vm.expectRevert("Pausable: paused");
        nodeDel.depositAssetIntoStrategy(address(rETH));

        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDel.depositAssetIntoStrategy(address(rETH));
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAddress = address(0x123);
        vm.startPrank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        nodeDel.depositAssetIntoStrategy(randomAddress);
        vm.stopPrank();
    }

    function test_DepositAssetIntoStrategy() external {
        vm.startPrank(manager);
        expectEmit();
        emit AssetDepositIntoStrategy(address(rETH), address(rETHMockStrategy), amountDeposited);
        nodeDel.depositAssetIntoStrategy(address(rETH));
        vm.stopPrank();

        // check that strategy received LST via the eigen strategy manager
        assertEq(rETH.balanceOf(address(rETHMockStrategy)), amountDeposited);
    }
}

contract NodeDelegatorTransferBackToLRTDepositPool is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));

        // transfer rETH to NodeDelegator
        vm.prank(bob);
        rETH.transfer(address(nodeDel), 10 ether);
    }

    function test_RevertWhenContractIsPaused() external {
        vm.startPrank(manager);
        nodeDel.pause();

        vm.expectRevert("Pausable: paused");
        nodeDel.transferBackToLRTDepositPool(address(rETH), 10 ether);

        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDel.transferBackToLRTDepositPool(address(rETH), 10 ether);
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAddress = address(0x123);
        vm.startPrank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        nodeDel.transferBackToLRTDepositPool(randomAddress, 10 ether);
        vm.stopPrank();
    }

    function test_TransferBackToLRTDepositPool() external {
        uint256 amountToDeposit = 3 ether;

        uint256 nodeDelBalanceBefore = rETH.balanceOf(address(nodeDel));

        // transfer funds in NodeDelegator to to LRTDepositPool
        vm.startPrank(manager);
        nodeDel.transferBackToLRTDepositPool(address(rETH), amountToDeposit);
        vm.stopPrank();

        uint256 nodeDelBalanceAfter = rETH.balanceOf(address(nodeDel));

        assertLt(nodeDelBalanceAfter, nodeDelBalanceBefore, "NodeDelegator balance did not increase");
        assertEq(nodeDelBalanceAfter, nodeDelBalanceBefore - amountToDeposit, "NodeDelegator balance did not increase");

        assertEq(rETH.balanceOf(mockLRTDepositPool), amountToDeposit, "LRTDepositPool balance did not increase");
    }
}

contract NodeDelegatorGetAssetBalances is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));

        // sends token to nodeDelegator so it can deposit it into the strategy
        vm.startPrank(bob);
        rETH.transfer(address(nodeDel), 10 ether);
        cbETH.transfer(address(nodeDel), 5 ether);
        vm.stopPrank();

        // max approve nodeDelegator to deposit into strategy
        vm.startPrank(manager);
        nodeDel.maxApproveToEigenStrategyManager(address(rETH));
        nodeDel.maxApproveToEigenStrategyManager(address(cbETH));
        vm.stopPrank();
    }

    function test_GetAssetBalances() external {
        // deposit NodeDelegator balance into strategy
        vm.startPrank(manager);
        nodeDel.depositAssetIntoStrategy(address(rETH));
        nodeDel.depositAssetIntoStrategy(address(cbETH));
        vm.stopPrank();

        // get asset balances in strategies
        (address[] memory assets, uint256[] memory assetBalances) = nodeDel.getAssetBalances();

        assertEq(assets.length, 2, "Incorrect number of assets");
        assertEq(assets[0], address(rETH), "Incorrect asset");
        assertEq(assets[1], address(cbETH), "Incorrect asset");
        assertEq(assetBalances.length, 2, "Incorrect number of asset balances");
        assertEq(assetBalances[0], mockUserUnderlyingViewBalance, "Incorrect asset balance for rETH");
        assertEq(assetBalances[1], mockUserUnderlyingViewBalance, "Incorrect asset balance for cbETH");
    }
}

contract NodeDelegatorGetAssetBalance is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));

        // sends token to nodeDelegator so it can deposit it into the strategy
        vm.prank(bob);
        rETH.transfer(address(nodeDel), 6 ether);

        // max approve nodeDelegator to deposit into strategy
        vm.prank(manager);
        nodeDel.maxApproveToEigenStrategyManager(address(rETH));
    }

    function test_GetAssetBalance() external {
        // deposit NodeDelegator balance into strategy
        vm.startPrank(manager);
        nodeDel.depositAssetIntoStrategy(address(rETH));
        vm.stopPrank();

        // get asset balances in strategies
        (uint256 rETHNodeDelBalance) = nodeDel.getAssetBalance(address(rETH));

        assertEq(rETHNodeDelBalance, mockUserUnderlyingViewBalance, "Incorrect asset balance");
    }
}

contract NodeDelegatorPause is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDel.pause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsAlreadyPaused() external {
        vm.startPrank(manager);
        nodeDel.pause();

        vm.expectRevert("Pausable: paused");
        nodeDel.pause();

        vm.stopPrank();
    }

    function test_Pause() external {
        vm.startPrank(manager);
        nodeDel.pause();

        vm.stopPrank();

        assertTrue(nodeDel.paused(), "Contract is not paused");
    }
}

contract NodeDelegatorUnpause is NodeDelegatorTest {
    function setUp() public override {
        super.setUp();
        nodeDel.initialize(address(lrtConfig));

        vm.startPrank(manager);
        nodeDel.pause();
        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        nodeDel.unpause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsNotPaused() external {
        vm.startPrank(admin);
        nodeDel.unpause();

        vm.expectRevert("Pausable: not paused");
        nodeDel.unpause();

        vm.stopPrank();
    }

    function test_Unpause() external {
        vm.startPrank(admin);
        nodeDel.unpause();

        vm.stopPrank();

        assertFalse(nodeDel.paused(), "Contract is still paused");
    }
}
