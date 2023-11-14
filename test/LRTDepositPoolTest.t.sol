// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import { BaseTest } from "./BaseTest.t.sol";
import { LRTDepositPool } from "src/LRTDepositPool.sol";
import { RSETHTest, ILRTConfig, UtilLib, LRTConstants } from "./RSETHTest.t.sol";
import { ILRTDepositPool } from "src/interfaces/ILRTDepositPool.sol";

import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import { console2 } from "forge-std/console2.sol";

contract LRTOracleMock {
    function getAssetPrice(address) external pure returns (uint256) {
        return 1e18;
    }

    function getRSETHPrice() external pure returns (uint256) {
        return 1e18;
    }
}

contract MockNodeDelegator {
    function getAssetBalance(address) external pure returns (uint256) {
        return 1e18;
    }
}

contract LRTDepositPoolTest is BaseTest, RSETHTest {
    LRTDepositPool public lrtDepositPool;

    function setUp() public virtual override(RSETHTest, BaseTest) {
        super.setUp();

        // deploy LRTDepositPool
        ProxyAdmin proxyAdmin = new ProxyAdmin();
        LRTDepositPool contractImpl = new LRTDepositPool();
        TransparentUpgradeableProxy contractProxy = new TransparentUpgradeableProxy(
            address(contractImpl),
            address(proxyAdmin),
            ""
        );

        lrtDepositPool = LRTDepositPool(address(contractProxy));

        // initialize RSETH. LRTCOnfig is already initialized in RSETHTest
        rseth.initialize(address(admin), address(lrtConfig));
        vm.startPrank(admin);
        // add rsETH to LRT config
        lrtConfig.setRSETH(address(rseth));
        // add oracle to LRT config
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, address(new LRTOracleMock()));

        // add minter role for rseth to lrtDepositPool
        rseth.grantRole(rseth.MINTER_ROLE(), address(lrtDepositPool));

        vm.stopPrank();
    }
}

contract LRTDepositPoolInitialize is LRTDepositPoolTest {
    function test_RevertWhenLRTConfigIsZeroAddress() external {
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtDepositPool.initialize(address(0));
    }

    function test_InitializeContractsVariables() external {
        lrtDepositPool.initialize(address(lrtConfig));

        assertEq(lrtDepositPool.maxNodeDelegatorCount(), 10, "Max node delegator count is not set");
        assertEq(address(lrtConfig), address(lrtDepositPool.lrtConfig()), "LRT config address is not set");
    }
}

contract LRTDepositPoolDepositAsset is LRTDepositPoolTest {
    address public rETHAddress;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        rETHAddress = address(rETH);

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertWhenDepositAmountIsZero() external {
        vm.expectRevert(ILRTDepositPool.InvalidAmount.selector);
        lrtDepositPool.depositAsset(rETHAddress, 0);

        // vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        // vm.stopPrank();

    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomAsset = makeAddr("randomAsset");

        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtDepositPool.depositAsset(randomAsset, 1 ether);
    }

    function test_RevertWhenDepositAmountExceedsLimit() external {
        vm.prank(manager);
        lrtConfig.updateAssetDepositLimit(rETHAddress, 1 ether);

        vm.expectRevert(ILRTDepositPool.MaximumDepositLimitReached.selector);
        lrtDepositPool.depositAsset(rETHAddress, 2 ether);
    }

    function test_DepositAsset() external {
        vm.startPrank(alice);

        // alice balance of rsETH before deposit
        uint256 aliceBalanceBefore = rseth.balanceOf(address(alice));

        rETH.approve(address(lrtDepositPool), 2 ether);
        lrtDepositPool.depositAsset(rETHAddress, 2 ether);

        // alice balance of rsETH after deposit
        uint256 aliceBalanceAfter = rseth.balanceOf(address(alice));
        vm.stopPrank();

        assertEq(lrtDepositPool.getTotalAssetDeposits(rETHAddress), 2 ether, "Total asset deposits is not set");
        assertGt(aliceBalanceAfter, aliceBalanceBefore, "Alice balance is not set");
    }

    function test_FuzzDepositAsset(uint256 amountDeposited) external {
        uint256 stETHDepositLimit = lrtConfig.depositLimitByAsset(address(stETH));
        vm.assume(amountDeposited > 0 && amountDeposited <= stETHDepositLimit);

        uint256 aliceBalanceBefore = rseth.balanceOf(address(alice));

        vm.startPrank(alice);
        stETH.approve(address(lrtDepositPool), amountDeposited);
        lrtDepositPool.depositAsset(address(stETH), amountDeposited);
        vm.stopPrank();

        uint256 aliceBalanceAfter = rseth.balanceOf(address(alice));

        assertEq(
            lrtDepositPool.getTotalAssetDeposits(address(stETH)), amountDeposited, "Total asset deposits is not set"
        );
        assertGt(aliceBalanceAfter, aliceBalanceBefore, "Alice balance is not set");
    }
}

contract LRTDepositPoolGetRsETHAmountToMint is LRTDepositPoolTest {
    address public rETHAddress;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        rETHAddress = address(rETH);

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_GetRsETHAmountToMint() external {
        uint256 amountToDeposit = 1 ether;
        console2.logUint(lrtConfig.depositLimitByAsset(rETHAddress) / 1e18);
        vm.startPrank(manager);
        lrtConfig.updateAssetDepositLimit(rETHAddress, amountToDeposit);
        vm.stopPrank();

        console2.logUint(lrtConfig.depositLimitByAsset(rETHAddress) / 1e18);

        assertEq(
            lrtDepositPool.getRsETHAmountToMint(rETHAddress, amountToDeposit),
            1 ether,
            "RsETH amount to mint is incorrect"
        );
    }
}

contract LRTDepositPoolGetAssetCurrentLimit is LRTDepositPoolTest {
    address public rETHAddress;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        rETHAddress = address(rETH);

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_GetAssetCurrentLimit() external {
        vm.startPrank(manager);
        lrtConfig.updateAssetDepositLimit(address(stETH), 1 ether);
        vm.stopPrank();

        assertEq(lrtDepositPool.getAssetCurrentLimit(address(stETH)), 1 ether, "Asset current limit is not set");
    }

    function test_GetAssetCurrentLimitAfterAssetIsDeposited() external {
        vm.startPrank(manager);
        lrtConfig.updateAssetDepositLimit(address(stETH), 10 ether);
        vm.stopPrank();

        // deposit 1 ether stETH
        vm.startPrank(alice);
        stETH.approve(address(lrtDepositPool), 6 ether);
        lrtDepositPool.depositAsset(address(stETH), 6 ether);
        vm.stopPrank();

        assertEq(lrtDepositPool.getAssetCurrentLimit(address(stETH)), 4 ether, "Asset current limit is not set");
    }
}

contract LRTDepositPoolGetNodeDelegatorQueue is LRTDepositPoolTest {
    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));
    }

    function test_GetNodeDelegatorQueue() external {
        address nodeDelegatorContractOne = address(new MockNodeDelegator());
        address nodeDelegatorContractTwo = address(new MockNodeDelegator());
        address nodeDelegatorContractThree = address(new MockNodeDelegator());

        address[] memory nodeDelegatorQueue = new address[](3);
        nodeDelegatorQueue[0] = nodeDelegatorContractOne;
        nodeDelegatorQueue[1] = nodeDelegatorContractTwo;
        nodeDelegatorQueue[2] = nodeDelegatorContractThree;

        vm.startPrank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueue);
        vm.stopPrank();

        assertEq(lrtDepositPool.getNodeDelegatorQueue(), nodeDelegatorQueue, "Node delegator queue is not set");
    }
}

contract LRTDepositPoolGetTotalAssetDeposits is LRTDepositPoolTest {
    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));
    }

    function test_GetTotalAssetDeposits() external {
        address nodeDelegatorContractOne = address(new MockNodeDelegator());
        address nodeDelegatorContractTwo = address(new MockNodeDelegator());
        address nodeDelegatorContractThree = address(new MockNodeDelegator());

        address[] memory nodeDelegatorQueue = new address[](3);
        nodeDelegatorQueue[0] = nodeDelegatorContractOne;
        nodeDelegatorQueue[1] = nodeDelegatorContractTwo;
        nodeDelegatorQueue[2] = nodeDelegatorContractThree;

        vm.startPrank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueue);
        vm.stopPrank();

        uint256 amountToDeposit = 1 ether;

        uint256 totalDepositsBefore = lrtDepositPool.getTotalAssetDeposits(address(rETH));

        // deposit rETH
        vm.startPrank(alice);
        rETH.approve(address(lrtDepositPool), amountToDeposit);
        lrtDepositPool.depositAsset(address(rETH), amountToDeposit);
        vm.stopPrank();

        assertEq(
            lrtDepositPool.getTotalAssetDeposits(address(rETH)),
            totalDepositsBefore + amountToDeposit,
            "Incorrect total asset deposits amount"
        );
    }
}

contract LRTDepositPoolGetAssetDistributionData is LRTDepositPoolTest {
    address public rETHAddress;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        rETHAddress = address(rETH);

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_GetAssetDistributionData() external {
        address nodeDelegatorContractOne = address(new MockNodeDelegator());
        address nodeDelegatorContractTwo = address(new MockNodeDelegator());
        address nodeDelegatorContractThree = address(new MockNodeDelegator());

        address[] memory nodeDelegatorQueue = new address[](3);
        nodeDelegatorQueue[0] = nodeDelegatorContractOne;
        nodeDelegatorQueue[1] = nodeDelegatorContractTwo;
        nodeDelegatorQueue[2] = nodeDelegatorContractThree;

        vm.startPrank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueue);
        vm.stopPrank();

        // deposit 3 ether rETH
        vm.startPrank(alice);
        rETH.approve(address(lrtDepositPool), 3 ether);
        lrtDepositPool.depositAsset(rETHAddress, 3 ether);
        vm.stopPrank();

        (uint256 assetLyingInDepositPool, uint256 assetLyingInNDCs, uint256 assetStakedInEigenLayer) =
            lrtDepositPool.getAssetDistributionData(rETHAddress);

        assertEq(assetLyingInDepositPool, 3 ether, "Asset lying in deposit pool is not set");
        assertEq(assetLyingInNDCs, 0, "Asset lying in NDCs is not set");
        assertEq(assetStakedInEigenLayer, 3 ether, "Asset staked in eigen layer is not set");
    }
}

contract LRTDepositPoolAddNodeDelegatorContractToQueue is LRTDepositPoolTest {
    address public nodeDelegatorContractOne;
    address public nodeDelegatorContractTwo;
    address public nodeDelegatorContractThree;

    address[] public nodeDelegatorQueueProspectives;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        nodeDelegatorContractOne = address(new MockNodeDelegator());
        nodeDelegatorContractTwo = address(new MockNodeDelegator());
        nodeDelegatorContractThree = address(new MockNodeDelegator());

        nodeDelegatorQueueProspectives.push(nodeDelegatorContractOne);
        nodeDelegatorQueueProspectives.push(nodeDelegatorContractTwo);
        nodeDelegatorQueueProspectives.push(nodeDelegatorContractThree);
    }

    function test_RevertWhenNotCalledByLRTConfigAdmin() external {
        vm.startPrank(alice);

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueueProspectives);

        vm.stopPrank();
    }

    function test_RevertWhenNodeDelegatorCountExceedsLimit() external {
        vm.startPrank(admin);

        uint256 maxDelegatorCount = lrtDepositPool.maxNodeDelegatorCount();

        for (uint256 i = 0; i < maxDelegatorCount; i++) {
            address madeUpNodeDelegatorAddress = makeAddr(string(abi.encodePacked("nodeDelegatorContract", i)));

            address[] memory nodeDelegatorContractArray = new address[](1);
            nodeDelegatorContractArray[0] = madeUpNodeDelegatorAddress;

            lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorContractArray);
        }

        // add one more node delegator contract to go above limit
        vm.expectRevert(ILRTDepositPool.MaximumNodeDelegatorCountReached.selector);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueueProspectives);

        vm.stopPrank();
    }

    function test_AddNodeDelegatorContractToQueue() external {
        vm.startPrank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueueProspectives);

        assertEq(
            lrtDepositPool.nodeDelegatorQueue(0),
            nodeDelegatorQueueProspectives[0],
            "Node delegator index 0 contract is not added"
        );
        assertEq(
            lrtDepositPool.nodeDelegatorQueue(1),
            nodeDelegatorQueueProspectives[1],
            "Node delegator index 1 contract is not added"
        );
        assertEq(
            lrtDepositPool.nodeDelegatorQueue(2),
            nodeDelegatorQueueProspectives[2],
            "Node delegator index 2 contract is not added"
        );
        vm.stopPrank();
    }
}

contract LRTDepositPoolTransferAssetToNodeDelegator is LRTDepositPoolTest {
    address public nodeDelegatorContractOne;
    address public nodeDelegatorContractTwo;
    address public nodeDelegatorContractThree;

    address[] public nodeDelegatorQueueProspectives;

    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        nodeDelegatorContractOne = address(new MockNodeDelegator());
        nodeDelegatorContractTwo = address(new MockNodeDelegator());
        nodeDelegatorContractThree = address(new MockNodeDelegator());

        nodeDelegatorQueueProspectives.push(nodeDelegatorContractOne);
        nodeDelegatorQueueProspectives.push(nodeDelegatorContractTwo);
        nodeDelegatorQueueProspectives.push(nodeDelegatorContractThree);

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();

        // add node delegator contracts to queue
        vm.startPrank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(nodeDelegatorQueueProspectives);
        vm.stopPrank();
    }

    function test_RevertWhenNotCalledByLRTConfigManager() external {
        vm.startPrank(alice);

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtDepositPool.transferAssetToNodeDelegator(0, address(rETH), 1 ether);

        vm.stopPrank();
    }

    function test_TransferAssetToNodeDelegator() external {
        // deposit 3 ether rETH
        vm.startPrank(alice);
        rETH.approve(address(lrtDepositPool), 3 ether);
        lrtDepositPool.depositAsset(address(rETH), 3 ether);
        vm.stopPrank();

        uint256 indexOfNodeDelegatorContractOneInNDArray;
        address[] memory nodeDelegatorArray = lrtDepositPool.getNodeDelegatorQueue();
        for (uint256 i = 0; i < nodeDelegatorArray.length; i++) {
            if (lrtDepositPool.nodeDelegatorQueue(i) == nodeDelegatorContractOne) {
                indexOfNodeDelegatorContractOneInNDArray = i;
                break;
            }
        }

        // transfer 1 ether rETH to node delegator contract one
        vm.startPrank(manager);
        lrtDepositPool.transferAssetToNodeDelegator(indexOfNodeDelegatorContractOneInNDArray, address(rETH), 1 ether);
        vm.stopPrank();

        assertEq(rETH.balanceOf(address(lrtDepositPool)), 2 ether, "Asset amount in lrtDepositPool is incorrect");
        assertEq(rETH.balanceOf(nodeDelegatorContractOne), 1 ether, "Asset is not transferred to node delegator");
    }
}

contract LRTDepositPoolUpdateMaxNodeDelegatorCount is LRTDepositPoolTest {
    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));
    }

    function test_RevertWhenNotCalledByLRTConfigAdmin() external {
        vm.startPrank(alice);

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.updateMaxNodeDelegatorCount(10);

        vm.stopPrank();
    }

    function test_UpdateMaxNodeDelegatorCount() external {
        vm.startPrank(admin);
        lrtDepositPool.updateMaxNodeDelegatorCount(10);
        vm.stopPrank();

        assertEq(lrtDepositPool.maxNodeDelegatorCount(), 10, "Max node delegator count is not set");
    }
}

contract LRTDepositPoolPause is LRTDepositPoolTest {
    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertWhenNotCalledByLRTConfigManager() external {
        vm.startPrank(alice);

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtDepositPool.pause();

        vm.stopPrank();
    }

    function test_Pause() external {
        vm.startPrank(manager);
        lrtDepositPool.pause();
        vm.stopPrank();

        assertTrue(lrtDepositPool.paused(), "LRTDepositPool is not paused");
    }
}

contract LRTDepositPoolUnpause is LRTDepositPoolTest {
    function setUp() public override {
        super.setUp();

        // initialize LRTDepositPool
        lrtDepositPool.initialize(address(lrtConfig));

        // add manager role within LRTConfig
        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertWhenNotCalledByLRTConfigAdmin() external {
        vm.startPrank(alice);

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.unpause();

        vm.stopPrank();
    }

    function test_Unpause() external {
        vm.prank(manager);
        lrtDepositPool.pause();
        vm.prank(admin);
        lrtDepositPool.unpause();

        assertFalse(lrtDepositPool.paused(), "LRTDepositPool is not unpaused");
    }
}
