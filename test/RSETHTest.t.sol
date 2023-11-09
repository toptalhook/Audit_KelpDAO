// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import { BaseTest } from "./BaseTest.t.sol";
import { RSETH } from "src/RSETH.sol";
import { LRTConfigTest, ILRTConfig, UtilLib, LRTConstants } from "./LRTConfigTest.t.sol";
import { TransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract RSETHTest is BaseTest, LRTConfigTest {
    RSETH public rseth;

    event UpdatedLRTConfig(address indexed _lrtConfig);

    function setUp() public virtual override(LRTConfigTest, BaseTest) {
        super.setUp();

        // initialize LRTConfig
        lrtConfig.initialize(admin, address(stETH), address(rETH), address(cbETH), rsethMock);

        ProxyAdmin proxyAdmin = new ProxyAdmin();
        RSETH tokenImpl = new RSETH();
        TransparentUpgradeableProxy tokenProxy = new TransparentUpgradeableProxy(
            address(tokenImpl),
            address(proxyAdmin),
            ""
        );

        rseth = RSETH(address(tokenProxy));
    }
}

contract RSETHInitialize is RSETHTest {
    function test_RevertWhenAdminIsZeroAddress() external {
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        rseth.initialize(address(0), address(lrtConfig));
    }

    function test_RevertWhenLRTConfigIsZeroAddress() external {
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        rseth.initialize(address(admin), address(0));
    }

    function test_InitializeContractsVariables() external {
        rseth.initialize(address(admin), address(lrtConfig));

        assertTrue(rseth.hasRole(rseth.DEFAULT_ADMIN_ROLE(), admin), "Admin address is not set");
        assertEq(address(lrtConfig), address(rseth.lrtConfig()), "LRT config address is not set");

        assertEq(rseth.name(), "rsETH", "Name is not set");
        assertEq(rseth.symbol(), "rsETH", "Symbol is not set");
    }
}

contract RSETHMint is RSETHTest {
    address public minter = makeAddr("minter");

    function setUp() public override {
        super.setUp();

        rseth.initialize(address(admin), address(lrtConfig));

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        rseth.grantRole(rseth.MINTER_ROLE(), minter);
        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotMinter() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6"
        );
        rseth.mint(address(this), 100 ether);
        vm.stopPrank();
    }

    function test_RevertMintIsPaused() external {
        vm.startPrank(manager);
        rseth.pause();
        vm.stopPrank();

        vm.startPrank(minter);
        vm.expectRevert("Pausable: paused");
        rseth.mint(address(this), 1 ether);
        vm.stopPrank();
    }

    function test_Mint() external {
        vm.startPrank(admin);

        rseth.grantRole(rseth.MINTER_ROLE(), msg.sender);

        vm.stopPrank();

        vm.startPrank(minter);

        rseth.mint(address(this), 100 ether);

        assertEq(rseth.balanceOf(address(this)), 100 ether, "Balance is not correct");

        vm.stopPrank();
    }
}

contract RSETHBurnFrom is RSETHTest {
    address public burner = makeAddr("burner");

    function setUp() public override {
        super.setUp();
        rseth.initialize(address(admin), address(lrtConfig));

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        rseth.grantRole(rseth.BURNER_ROLE(), burner);

        // give minter role to admin
        rseth.grantRole(rseth.MINTER_ROLE(), admin);
        rseth.mint(address(this), 100 ether);

        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotBurner() external {
        vm.startPrank(bob);
        vm.expectRevert(
            "AccessControl: account 0x1d96f2f6bef1202e4ce1ff6dad0c2cb002861d3e is missing role 0x3c11d16cbaffd01df69ce1c404f6340ee057498f5f00246190ea54220576a848"
        );
        rseth.burnFrom(address(this), 100 ether);
        vm.stopPrank();
    }

    function test_RevertBurnIsPaused() external {
        vm.prank(manager);
        rseth.pause();

        vm.prank(burner);
        vm.expectRevert("Pausable: paused");
        rseth.burnFrom(address(this), 100 ether);
    }

    function test_BurnFrom() external {
        vm.prank(burner);
        rseth.burnFrom(address(this), 100 ether);

        assertEq(rseth.balanceOf(address(this)), 0, "Balance is not correct");
    }
}

contract RSETHPause is RSETHTest {
    function setUp() public override {
        super.setUp();
        rseth.initialize(address(admin), address(lrtConfig));

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, manager);
        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.startPrank(alice);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        rseth.pause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsAlreadyPaused() external {
        vm.startPrank(manager);
        rseth.pause();

        vm.expectRevert("Pausable: paused");
        rseth.pause();

        vm.stopPrank();
    }

    function test_Pause() external {
        vm.startPrank(manager);
        rseth.pause();

        vm.stopPrank();

        assertTrue(rseth.paused(), "Contract is not paused");
    }
}

contract RSETHUnpause is RSETHTest {
    function setUp() public override {
        super.setUp();
        rseth.initialize(address(admin), address(lrtConfig));

        vm.startPrank(admin);
        lrtConfig.grantRole(LRTConstants.MANAGER, admin);
        rseth.pause();
        vm.stopPrank();
    }

    function test_RevertWhenCallerIsNotLRTAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        rseth.unpause();
        vm.stopPrank();
    }

    function test_RevertWhenContractIsNotPaused() external {
        vm.startPrank(admin);
        rseth.unpause();

        vm.expectRevert("Pausable: not paused");
        rseth.unpause();

        vm.stopPrank();
    }

    function test_Unpause() external {
        vm.startPrank(admin);
        rseth.unpause();

        vm.stopPrank();

        assertFalse(rseth.paused(), "Contract is still paused");
    }
}

contract RSETHUpdateLRTConfig is RSETHTest {
    function setUp() public override {
        super.setUp();
        rseth.initialize(address(admin), address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTAdmin() external {
        vm.startPrank(alice);
        vm.expectRevert(
            "AccessControl: account 0x328809bc894f92807417d2dad6b7c998c1afdac6 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        rseth.updateLRTConfig(address(lrtConfig));
        vm.stopPrank();
    }

    function test_RevertWhenLRTConfigIsZeroAddress() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        rseth.updateLRTConfig(address(0));
        vm.stopPrank();
    }

    function test_UpdateLRTConfig() external {
        address newLRTConfigAddress = makeAddr("MockNewLRTConfig");
        ILRTConfig newLRTConfig = ILRTConfig(newLRTConfigAddress);

        vm.startPrank(admin);
        expectEmit();
        emit UpdatedLRTConfig(address(newLRTConfig));
        rseth.updateLRTConfig(address(newLRTConfig));
        vm.stopPrank();

        assertEq(address(newLRTConfig), address(rseth.lrtConfig()), "LRT config address is not set");
    }
}
