// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import { BaseTest, MockToken } from "./BaseTest.t.sol";
import { LRTConfig, ILRTConfig } from "src/LRTConfig.sol";
import { LRTConstants } from "src/utils/LRTConstants.sol";
import { UtilLib } from "src/utils/UtilLib.sol";
import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract LRTConfigTest is BaseTest {
    LRTConfig public lrtConfig;

    event AssetDepositLimitUpdate(address asset, uint256 depositLimit);
    event RemovedSupportedAsset(address asset);

    address public manager;
    address public rsethMock;

    function setUp() public virtual override {
        super.setUp();

        manager = makeAddr("manager");
        rsethMock = makeAddr("rsethMock");

        ProxyAdmin proxyAdmin = new ProxyAdmin();
        LRTConfig lrtConfigImpl = new LRTConfig();
        TransparentUpgradeableProxy lrtConfigProxy = new TransparentUpgradeableProxy(
            address(lrtConfigImpl),
            address(proxyAdmin),
            ""
        );

        lrtConfig = LRTConfig(address(lrtConfigProxy));
    }
}

contract LRTConfigInitialize is LRTConfigTest {
    function test_RevertInitializeIfAlreadyInitialized() external {
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        // cannot initialize again
        vm.expectRevert("Initializable: contract is already initialized");
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);
        vm.stopPrank();
    }

    function test_RevertInitializeIfAdminIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.initialize(address(0), address(stETH), address(rETH), address(cbETH), rsethMock);
        vm.stopPrank();
    }

    function test_RevertInitializeIfStETHIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.initialize(admin, address(0), address(rETH), address(cbETH), rsethMock);
        vm.stopPrank();
    }

    function test_RevertInitializeIfRETHIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.initialize(admin, address(stETH), address(0), address(cbETH), rsethMock);
        vm.stopPrank();
    }

    function test_RevertInitializeIfCbETHIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(0), rsethMock);
        vm.stopPrank();
    }

    function test_RevertWhenRSETHIsZeroAddress() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), address(0));
        vm.stopPrank();
    }

    function test_SetInitializableValues() external {
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        assertEq(lrtConfig.tokenMap(LRTConstants.ST_ETH_TOKEN), address(stETH));
        assertEq(lrtConfig.tokenMap(LRTConstants.R_ETH_TOKEN), address(rETH));
        assertEq(lrtConfig.tokenMap(LRTConstants.CB_ETH_TOKEN), address(cbETH));
        assertTrue(lrtConfig.hasRole(lrtConfig.DEFAULT_ADMIN_ROLE(), admin));

        uint256 depositLimit = 100_000 ether;
        assertEq(lrtConfig.depositLimitByAsset(address(stETH)), depositLimit);
        assertEq(lrtConfig.depositLimitByAsset(address(rETH)), depositLimit);
        assertEq(lrtConfig.depositLimitByAsset(address(cbETH)), depositLimit);
    }
}

contract LRTConfigAddNewSupportedAssetTest is LRTConfigTest {
    function setUp() public override {
        super.setUp();

        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsZero() external {
        vm.startPrank(manager);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.addNewSupportedAsset(address(0), 1000);
        vm.stopPrank();
    }

    function test_RevertAddNewSupportedAssetIfNotManager() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0xaf290d8680820aad922855f39b306097b20e28774d6c1ad35a20325630c3a02c"
        );
        lrtConfig.addNewSupportedAsset(address(stETH), 1000);
        vm.stopPrank();
    }

    function test_RevertAddNewSupportedAssetIfAssetAlreadySupported() external {
        vm.startPrank(manager);
        vm.expectRevert(ILRTConfig.AssetAlreadySupported.selector);
        lrtConfig.addNewSupportedAsset(address(stETH), 1000);
        vm.stopPrank();
    }

    function test_AddNewSupportedAsset() external {
        uint256 depositLimit = 1000;
        MockToken newToken = new MockToken("New Token", "NT");

        vm.startPrank(manager);
        lrtConfig.addNewSupportedAsset(address(newToken), depositLimit);
        vm.stopPrank();

        assertEq(lrtConfig.depositLimitByAsset(address(newToken)), depositLimit);
    }
}

contract LRTConfigUpdateAssetDepositLimitTest is LRTConfigTest {
    function setUp() public override {
        super.setUp();

        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertUpdateAssetDepositLimitIfNotManager() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0xaf290d8680820aad922855f39b306097b20e28774d6c1ad35a20325630c3a02c"
        );
        lrtConfig.updateAssetDepositLimit(address(stETH), 1000);
        vm.stopPrank();
    }

    function test_RevertUpdateAssetDepositLimitWhenNotAcceptedAsset() external {
        vm.startPrank(manager);
        MockToken randomToken = new MockToken("Random Token", "RT");
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtConfig.updateAssetDepositLimit(address(randomToken), 1000);
        vm.stopPrank();
    }

    function test_UpdateAssetDepositLimit() external {
        uint256 depositLimit = 1000;

        vm.startPrank(manager);
        lrtConfig.updateAssetDepositLimit(address(stETH), depositLimit);
        lrtConfig.updateAssetDepositLimit(address(rETH), depositLimit);

        expectEmit();
        emit AssetDepositLimitUpdate(address(cbETH), depositLimit);
        lrtConfig.updateAssetDepositLimit(address(cbETH), depositLimit);

        vm.stopPrank();

        assertEq(lrtConfig.depositLimitByAsset(address(stETH)), depositLimit);
        assertEq(lrtConfig.depositLimitByAsset(address(rETH)), depositLimit);
        assertEq(lrtConfig.depositLimitByAsset(address(cbETH)), depositLimit);
    }
}

contract LRTConfigUpdateAssetStrategyTest is LRTConfigTest {
    function setUp() public override {
        super.setUp();

        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertUpdateAssetStrategyIfNotAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.updateAssetStrategy(address(stETH), address(this));
        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupported() external {
        MockToken randomToken = new MockToken("Random Token", "RT");
        address strategy = makeAddr("strategy");

        vm.startPrank(admin);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtConfig.updateAssetStrategy(address(randomToken), strategy);
        vm.stopPrank();
    }

    function test_RevertWhenStrategyAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.updateAssetStrategy(address(stETH), address(0));
        vm.stopPrank();
    }

    function test_RevertWhenSameStrategyWasAlreadyAddedBeforeForAsset() external {
        address strategy = makeAddr("strategy");
        vm.startPrank(admin);
        lrtConfig.updateAssetStrategy(address(stETH), strategy);

        // revert when same strategy was already added before for asset
        vm.expectRevert(ILRTConfig.ValueAlreadyInUse.selector);
        lrtConfig.updateAssetStrategy(address(stETH), strategy);
        vm.stopPrank();
    }

    function test_UpdateAssetStrategy() external {
        address strategy = makeAddr("strategy");

        vm.startPrank(admin);
        lrtConfig.updateAssetStrategy(address(stETH), strategy);
        vm.stopPrank();

        assertEq(lrtConfig.assetStrategy(address(stETH)), strategy);
    }
}

contract LRTConfigGettersTest is LRTConfigTest {
    function setUp() public override {
        super.setUp();

        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_GetLSTToken() external {
        assertEq(lrtConfig.getLSTToken(LRTConstants.ST_ETH_TOKEN), address(stETH));
        assertEq(lrtConfig.getLSTToken(LRTConstants.R_ETH_TOKEN), address(rETH));
        assertEq(lrtConfig.getLSTToken(LRTConstants.CB_ETH_TOKEN), address(cbETH));
    }

    function test_GetContract() external {
        vm.startPrank(admin);
        address oracle = makeAddr("oracle");
        address depositPool = makeAddr("depositPool");
        address eigenStrategyManager = makeAddr("eigenStrategyManager");
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, oracle);
        lrtConfig.setContract(LRTConstants.LRT_DEPOSIT_POOL, depositPool);
        lrtConfig.setContract(LRTConstants.EIGEN_STRATEGY_MANAGER, eigenStrategyManager);
        vm.stopPrank();

        assertEq(lrtConfig.getContract(LRTConstants.LRT_ORACLE), address(oracle));
        assertEq(lrtConfig.getContract(LRTConstants.LRT_DEPOSIT_POOL), address(depositPool));
        assertEq(lrtConfig.getContract(LRTConstants.EIGEN_STRATEGY_MANAGER), address(eigenStrategyManager));
    }
}

contract LRTConfigSettersTest is LRTConfigTest {
    address public newRSETH;

    function setUp() public override {
        super.setUp();

        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();

        newRSETH = makeAddr("newRSETH");
    }

    function test_RevertSetRSETHIfNotAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setRSETH(newRSETH);
        vm.stopPrank();
    }

    function test_RevertSetRSETHIfRSETHAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.setRSETH(address(0));
        vm.stopPrank();
    }

    function test_SetRSETH() external {
        vm.startPrank(admin);
        lrtConfig.setRSETH(newRSETH);
        vm.stopPrank();

        assertEq(lrtConfig.rsETH(), newRSETH);
    }

    function test_RevertSetTokenIfNotAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, address(this));
        vm.stopPrank();
    }

    function test_RevertSetTokenIfTokenAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, address(0));
        vm.stopPrank();
    }

    function test_RevertSetTokenIfTokenAlreadySet() external {
        address newToken = makeAddr("newToken");
        vm.startPrank(admin);
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, newToken);

        // revert when same token was already set before
        vm.expectRevert(ILRTConfig.ValueAlreadyInUse.selector);
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, newToken);
        vm.stopPrank();
    }

    function test_SetToken() external {
        address newToken = makeAddr("newToken");

        vm.startPrank(admin);
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, newToken);
        vm.stopPrank();

        assertEq(lrtConfig.tokenMap(LRTConstants.ST_ETH_TOKEN), newToken);
    }

    function test_RevertSetContractIfNotAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, address(this));
        vm.stopPrank();
    }

    function test_RevertSetContractIfContractAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, address(0));
        vm.stopPrank();
    }

    function test_RevertSetContractIfContractAlreadySet() external {
        address newContract = makeAddr("newContract");
        vm.startPrank(admin);
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, newContract);

        // revert when same contract was already set before
        vm.expectRevert(ILRTConfig.ValueAlreadyInUse.selector);
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, newContract);
        vm.stopPrank();
    }

    function test_SetContract() external {
        address newContract = makeAddr("newContract");

        vm.startPrank(admin);
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, newContract);
        vm.stopPrank();

        assertEq(lrtConfig.contractMap(LRTConstants.LRT_ORACLE), newContract);
    }
}
