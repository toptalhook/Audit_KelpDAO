// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import { LRTConfigTest, ILRTConfig, LRTConstants, UtilLib, MockToken } from "./LRTConfigTest.t.sol";
import { LRTOracle } from "src/LRTOracle.sol";
import { UtilLib } from "src/utils/UtilLib.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockPriceOracle {
    function getAssetPrice(address) external pure returns (uint256) {
        return 2 ether;
    }
}

contract MockLRTDepositPool {
    function getAssetDistributionData(address)
        external
        pure
        returns (uint256 assetLyingInDepositPool, uint256 assetLyingInNDCs, uint256 assetStakedInEigenLayer)
    {
        return (0, 0, 1 ether);
    }

    function getTotalAssetDeposits(address) external pure returns (uint256) {
        return 1 ether;
    }
}

contract LRTOracleTest is LRTConfigTest {
    LRTOracle public lrtOracle;
    MockLRTDepositPool public lrtDepositPoolMock;
    MockToken public rsETHMock;

    event UpdatedLRTConfig(address indexed lrtConfig);
    event AssetPriceOracleUpdate(address indexed asset, address indexed priceOracle);

    function setUp() public virtual override {
        super.setUp();

        rsETHMock = new MockToken("rsETH", "rsETH");

        // initialize LRTConfig
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), address(rsETHMock));

        lrtDepositPoolMock = new MockLRTDepositPool();

        // add manager role
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        lrtConfig.setContract(LRTConstants.LRT_DEPOSIT_POOL, address(lrtDepositPoolMock));
        vm.stopPrank();

        ProxyAdmin proxyAdmin = new ProxyAdmin();
        LRTOracle lrtOracleImpl = new LRTOracle();
        TransparentUpgradeableProxy lrtOracleProxy = new TransparentUpgradeableProxy(
            address(lrtOracleImpl),
            address(proxyAdmin),
            ""
        );

        lrtOracle = LRTOracle(address(lrtOracleProxy));
    }
}

contract LRTOracleInitialize is LRTOracleTest {
    function test_RevertInitializeIfAlreadyInitialized() external {
        lrtOracle.initialize(address(lrtConfig));

        vm.startPrank(admin);
        // cannot initialize again
        vm.expectRevert("Initializable: contract is already initialized");
        lrtOracle.initialize(address(lrtConfig));
        vm.stopPrank();
    }

    function test_RevertInitializeIfLRTConfigIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtOracle.initialize(address(0));
        vm.stopPrank();
    }

    function test_SetInitializableValues() external {
        expectEmit();
        emit UpdatedLRTConfig(address(lrtConfig));
        lrtOracle.initialize(address(lrtConfig));

        assertEq(address(lrtOracle.lrtConfig()), address(lrtConfig));
    }
}

contract LRTOracleSetPriceOracle is LRTOracleTest {
    MockPriceOracle public priceOracle;

    function setUp() public override {
        super.setUp();
        lrtOracle.initialize(address(lrtConfig));

        priceOracle = new MockPriceOracle();
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtOracle.updatePriceOracleFor(address(rETH), address(priceOracle));
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAddress = address(0x123);
        vm.startPrank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtOracle.updatePriceOracleFor(randomAddress, address(priceOracle));
        vm.stopPrank();
    }

    function test_RevertWhenPriceOracleIsZero() external {
        vm.startPrank(manager);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtOracle.updatePriceOracleFor(address(rETH), address(0));
        vm.stopPrank();
    }

    function test_SetAssetPriceFeed() external {
        assertEq(lrtOracle.assetPriceOracle(address(rETH)), address(0));

        vm.startPrank(manager);
        expectEmit();
        emit AssetPriceOracleUpdate(address(rETH), address(priceOracle));
        lrtOracle.updatePriceOracleFor(address(rETH), address(priceOracle));
        vm.stopPrank();

        assertEq(lrtOracle.assetPriceOracle(address(rETH)), address(priceOracle));
    }
}

contract LRTOracleFetchAssetPrice is LRTOracleTest {
    MockPriceOracle public priceOracle;

    function setUp() public override {
        super.setUp();
        lrtOracle.initialize(address(lrtConfig));
        priceOracle = new MockPriceOracle();

        vm.prank(manager);
        lrtOracle.updatePriceOracleFor(address(rETH), address(priceOracle));
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAddress = address(0x123);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtOracle.getAssetPrice(randomAddress);
    }

    function test_FetchAssetPrice() external {
        uint256 rETHPrice = lrtOracle.getAssetPrice(address(rETH));
        assertEq(rETHPrice, 2 ether);
    }
}

contract LRTOracleFetchRSETHPrice is LRTOracleTest {
    MockPriceOracle public priceOracle;

    function setUp() public override {
        super.setUp();

        lrtOracle.initialize(address(lrtConfig));
        priceOracle = new MockPriceOracle();

        vm.startPrank(manager);
        lrtOracle.updatePriceOracleFor(address(rETH), address(priceOracle));
        lrtOracle.updatePriceOracleFor(address(stETH), address(priceOracle));
        lrtOracle.updatePriceOracleFor(address(cbETH), address(priceOracle));
        vm.stopPrank();
    }

    function test_FetchRSETHPriceWhenRSETHSupplyIsZero() external {
        assertEq(rsETHMock.totalSupply(), 0);
        assertEq(lrtOracle.getRSETHPrice(), 1 ether);
    }

    function test_FetchRSETHPrice() external {
        vm.mockCall(address(rsETHMock), abi.encodeWithSelector(ERC20.totalSupply.selector), abi.encode(3 ether));
        assertEq(rsETHMock.totalSupply(), 3 ether);
        assertEq(lrtOracle.getRSETHPrice(), 2 ether);
    }
}

contract LRTOraclePause is LRTOracleTest {
    function setUp() public override {
        super.setUp();
        lrtOracle.initialize(address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtOracle.pause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsAlreadyPaused() external {
        vm.startPrank(manager);
        lrtOracle.pause();

        vm.expectRevert("Pausable: paused");
        lrtOracle.pause();

        vm.stopPrank();
    }

    function test_Pause() external {
        vm.startPrank(manager);
        lrtOracle.pause();

        vm.stopPrank();

        assertTrue(lrtOracle.paused(), "Contract is not paused");
    }
}

contract LRTOracleUnpause is LRTOracleTest {
    function setUp() public override {
        super.setUp();
        lrtOracle.initialize(address(lrtConfig));

        vm.startPrank(manager);
        lrtOracle.pause();
        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtOracle.unpause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsNotPaused() external {
        vm.startPrank(admin);
        lrtOracle.unpause();

        vm.expectRevert("Pausable: not paused");
        lrtOracle.unpause();

        vm.stopPrank();
    }

    function test_Unpause() external {
        vm.startPrank(admin);
        lrtOracle.unpause();

        vm.stopPrank();

        assertFalse(lrtOracle.paused(), "Contract is still paused");
    }
}
