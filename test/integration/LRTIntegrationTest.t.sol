// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import "forge-std/Test.sol";
import { LRTDepositPool, ILRTDepositPool, LRTConstants } from "src/LRTDepositPool.sol";
import { LRTConfig, ILRTConfig } from "src/LRTConfig.sol";
import { RSETH } from "src/RSETH.sol";
import { LRTOracle } from "src/LRTOracle.sol";
import { NodeDelegator } from "src/NodeDelegator.sol";
import { UtilLib } from "src/utils/UtilLib.sol";
import { getLSTs } from "script/foundry-scripts/DeployLRT.s.sol";

import { Strings } from "@openzeppelin/contracts/utils/Strings.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LRTIntegrationTest is Test {
    uint256 public goerliFork;

    LRTDepositPool public lrtDepositPool;
    LRTConfig public lrtConfig;
    RSETH public rseth;
    LRTOracle public lrtOracle;
    NodeDelegator public nodeDelegator1;

    address public admin = 0x7E9bb9673aC38071a7699e6A3C48b8fBDE574Cd0;
    address public manager = 0x7E9bb9673aC38071a7699e6A3C48b8fBDE574Cd0;

    address public stETHAddress;
    address public rETHAddress;
    address public cbETHAddress;

    address public stWhale = 0xD5d883B90030311530620E0ABEe93189c8aAe032;
    address public rETHWhale = 0x879944A8cB437a5f8061361f82A6d4EED59070b5;

    function setUp() public virtual {
        string memory goerliRPC = vm.envString("PROVIDER_URL_TESTNET");
        goerliFork = vm.createSelectFork(goerliRPC);

        lrtDepositPool = LRTDepositPool(0x55052ba1a135c43a17cf6CeE58a59c782CeF1Bcf);
        lrtConfig = LRTConfig(0x99Abf439a4e9910934Dea47082286a04986820b5);
        rseth = RSETH(0xDa3FF613C5A44F743E5F46c43D1f6F897F425205);
        lrtOracle = LRTOracle(0xE64060B802563d6B74d5CC72F0ba27a5a1B5B7f7);
        nodeDelegator1 = NodeDelegator(0x89cD79e873DEA08D1AfA173B9160c8D31e4Bc9f0);

        (stETHAddress, rETHAddress, cbETHAddress) = getLSTs();
    }
}

contract LRTDepositPoolIntegrationTest is LRTIntegrationTest {
    function test_LRTDepositPoolIsAlreadyInitialized() public {
        // attempt to initialize LRTDepositPool again reverts
        vm.expectRevert("Initializable: contract is already initialized");
        lrtDepositPool.initialize(address(lrtConfig));
    }

    function test_RevertWhenDepositAmountIsZeroForDepositAsset() external {
        vm.expectRevert(ILRTDepositPool.InvalidAmount.selector);
        lrtDepositPool.depositAsset(rETHAddress, 0);
    }

    function test_RevertWhenAssetIsNotSupportedForDepositAsset() external {
        address randomAsset = makeAddr("randomAsset");

        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtDepositPool.depositAsset(randomAsset, 1 ether);
    }

    function test_DepositAssetSTETHWorksWhenUsingTheCorrectConditions() external {
        uint256 amountToDeposit = 2 ether;

        // stWhale balance of rsETH before deposit
        uint256 stWhaleBalanceBefore = rseth.balanceOf(stWhale);
        // total asset deposits before deposit for stETH
        uint256 totalAssetDepositsBefore = lrtDepositPool.getTotalAssetDeposits(stETHAddress);
        // balance of lrtDepositPool before deposit
        uint256 lrtDepositPoolBalanceBefore = ERC20(stETHAddress).balanceOf(address(lrtDepositPool));

        uint256 whaleStETHBalBefore = ERC20(stETHAddress).balanceOf(address(stWhale));
        vm.startPrank(stWhale);
        ERC20(stETHAddress).approve(address(lrtDepositPool), amountToDeposit);
        lrtDepositPool.depositAsset(stETHAddress, amountToDeposit);
        vm.stopPrank();
        uint256 whaleStETHBalAfter = ERC20(stETHAddress).balanceOf(address(stWhale));

        console.log("whale stETH amount transfer:", whaleStETHBalBefore - whaleStETHBalAfter);

        // stWhale balance of rsETH after deposit
        uint256 stWhaleBalanceAfter = rseth.balanceOf(address(stWhale));

        assertApproxEqAbs(
            lrtDepositPool.getTotalAssetDeposits(stETHAddress),
            totalAssetDepositsBefore + amountToDeposit,
            1,
            "Total asset deposits check is incorrect"
        );
        assertApproxEqAbs(
            ERC20(stETHAddress).balanceOf(address(lrtDepositPool)),
            lrtDepositPoolBalanceBefore + amountToDeposit,
            1,
            "lrtDepositPool balance is not set"
        );
        assertGt(stWhaleBalanceAfter, stWhaleBalanceBefore, "Alice balance is not set");
    }

    function test_DepositAssetRETHWorksWhenUsingTheCorrectConditions() external {
        uint256 amountToDeposit = 2 ether;

        // rETHWhale balance of rsETH before deposit
        uint256 rETHWhaleBalanceBefore = rseth.balanceOf(rETHWhale);
        // total asset deposits before deposit for rETHETH
        uint256 totalAssetDepositsBefore = lrtDepositPool.getTotalAssetDeposits(rETHAddress);
        // balance of lrtDepositPool before deposit
        uint256 lrtDepositPoolBalanceBefore = ERC20(rETHAddress).balanceOf(address(lrtDepositPool));

        uint256 whalerETHBalBefore = ERC20(rETHAddress).balanceOf(address(rETHWhale));
        vm.startPrank(rETHWhale);
        ERC20(rETHAddress).approve(address(lrtDepositPool), amountToDeposit);
        lrtDepositPool.depositAsset(rETHAddress, amountToDeposit);
        vm.stopPrank();
        uint256 whalerETHBalAfter = ERC20(rETHAddress).balanceOf(address(rETHWhale));

        console.log("whale rETHETH amount transfer:", whalerETHBalBefore - whalerETHBalAfter);

        // rETHWhale balance of rsETH after deposit
        uint256 rETHWhaleBalanceAfter = rseth.balanceOf(address(rETHWhale));

        assertEq(
            lrtDepositPool.getTotalAssetDeposits(rETHAddress),
            totalAssetDepositsBefore + amountToDeposit,
            "Total asset deposits check is incorrect"
        );
        assertEq(
            ERC20(rETHAddress).balanceOf(address(lrtDepositPool)),
            lrtDepositPoolBalanceBefore + amountToDeposit,
            "lrtDepositPool balance is not set"
        );
        assertGt(rETHWhaleBalanceAfter, rETHWhaleBalanceBefore, "Alice balance is not set");
    }

    function test_GetCurrentAssetLimitAfterAssetIsDepositedInLRTDepositPool() external {
        uint256 depositAmount = 3 ether;

        uint256 stETHDepositLimitBefore = lrtDepositPool.getAssetCurrentLimit(stETHAddress);

        vm.startPrank(stWhale);
        ERC20(stETHAddress).approve(address(lrtDepositPool), depositAmount);
        lrtDepositPool.depositAsset(stETHAddress, depositAmount);
        vm.stopPrank();

        uint256 stETHDepositLimitAfter = lrtDepositPool.getAssetCurrentLimit(stETHAddress);

        assertGt(stETHDepositLimitBefore, stETHDepositLimitAfter, "Deposit limit is not set");
    }

    function test_RevertWhenCallingAddNodeDelegatorByANonLRTAdmin() external {
        address randomAddress = makeAddr("randomAddress");

        address[] memory addNodeDelegatorArray = new address[](1);
        addNodeDelegatorArray[0] = randomAddress;

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.addNodeDelegatorContractToQueue(addNodeDelegatorArray);
    }

    function test_IsAbleToAddNodeDelegatorByLRTAdmin() external {
        address randomAddress = makeAddr("randomAddress");

        address[] memory addNodeDelegatorArray = new address[](1);
        addNodeDelegatorArray[0] = randomAddress;

        vm.prank(admin);
        lrtDepositPool.addNodeDelegatorContractToQueue(addNodeDelegatorArray);

        // 5 nodeDelegators were already added in contract at the time of deployment
        assertEq(lrtDepositPool.nodeDelegatorQueue(5), randomAddress, "Node delegator is not added");
    }

    function test_RevertWhenCallingTransferAssetToNodeDelegatorWhenNotCalledByManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        uint256 indexOfNodeDelegator = 0;
        lrtDepositPool.transferAssetToNodeDelegator(indexOfNodeDelegator, stETHAddress, 1 ether);
    }

    function test_TransferAssetSTETHToNodeDelegatorWhenCalledbyManager() external {
        uint256 amountToTransfer = 1e18;

        uint256 lrtDepositPoolBalanceBefore = ERC20(stETHAddress).balanceOf(address(lrtDepositPool));
        uint256 totalDepositsInStETHBeforeDeposit = lrtDepositPool.getTotalAssetDeposits(stETHAddress);

        vm.startPrank(stWhale);
        ERC20(stETHAddress).approve(address(lrtDepositPool), amountToTransfer);
        lrtDepositPool.depositAsset(stETHAddress, amountToTransfer);
        vm.stopPrank();

        assertApproxEqAbs(
            ERC20(stETHAddress).balanceOf(address(lrtDepositPool)),
            lrtDepositPoolBalanceBefore + amountToTransfer,
            1,
            "lrtDepositPool balance is not set"
        );

        uint256 indexOfNodeDelegator;
        // find index of nodeDelegator1
        address[] memory nodeDelegatorArray = lrtDepositPool.getNodeDelegatorQueue();
        for (uint256 i = 0; i < nodeDelegatorArray.length; i++) {
            if (nodeDelegatorArray[i] == address(nodeDelegator1)) {
                indexOfNodeDelegator = i;
                break;
            }
        }

        uint256 nodeDelegator1BalanceBefore = ERC20(stETHAddress).balanceOf(address(nodeDelegator1));

        vm.prank(manager);
        lrtDepositPool.transferAssetToNodeDelegator(indexOfNodeDelegator, stETHAddress, amountToTransfer);

        uint256 nodeDelegator1BalanceAfter = ERC20(stETHAddress).balanceOf(address(nodeDelegator1));

        assertApproxEqAbs(
            lrtDepositPool.getTotalAssetDeposits(stETHAddress),
            totalDepositsInStETHBeforeDeposit + amountToTransfer,
            1,
            "Total asset deposits is not set"
        );

        // assert nodeDelegator1 balance before + 1 ether is equal to nodeDelegator1 balance after
        assertApproxEqAbs(
            nodeDelegator1BalanceAfter,
            nodeDelegator1BalanceBefore + amountToTransfer,
            1,
            "node delegator 1 balance is not set"
        );
        assertApproxEqAbs(
            ERC20(stETHAddress).balanceOf(address(nodeDelegator1)),
            amountToTransfer,
            1,
            "node delegator 1 balance is not set"
        );
    }

    function test_TransferAssetRETHToNodeDelegatorWhenCalledbyManager() external {
        uint256 amountToTransfer = 1e18;

        uint256 lrtDepositPoolBalanceBefore = ERC20(rETHAddress).balanceOf(address(lrtDepositPool));
        uint256 totalDepositsInrETHBeforeDeposit = lrtDepositPool.getTotalAssetDeposits(rETHAddress);

        vm.startPrank(stWhale);
        ERC20(rETHAddress).approve(address(lrtDepositPool), amountToTransfer);
        lrtDepositPool.depositAsset(rETHAddress, amountToTransfer);
        vm.stopPrank();

        assertEq(
            ERC20(rETHAddress).balanceOf(address(lrtDepositPool)),
            lrtDepositPoolBalanceBefore + amountToTransfer,
            "lrtDepositPool balance is not set"
        );

        uint256 indexOfNodeDelegator;
        // find index of nodeDelegator1
        address[] memory nodeDelegatorArray = lrtDepositPool.getNodeDelegatorQueue();
        for (uint256 i = 0; i < nodeDelegatorArray.length; i++) {
            if (nodeDelegatorArray[i] == address(nodeDelegator1)) {
                indexOfNodeDelegator = i;
                break;
            }
        }

        uint256 nodeDelegator1BalanceBefore = ERC20(rETHAddress).balanceOf(address(nodeDelegator1));

        vm.prank(manager);
        lrtDepositPool.transferAssetToNodeDelegator(indexOfNodeDelegator, rETHAddress, amountToTransfer);

        uint256 nodeDelegator1BalanceAfter = ERC20(rETHAddress).balanceOf(address(nodeDelegator1));

        assertEq(
            lrtDepositPool.getTotalAssetDeposits(rETHAddress),
            totalDepositsInrETHBeforeDeposit + amountToTransfer,
            "Total asset deposits is not set"
        );

        // assert nodeDelegator1 balance before + 1 ether is equal to nodeDelegator1 balance after
        assertEq(
            nodeDelegator1BalanceAfter,
            nodeDelegator1BalanceBefore + amountToTransfer,
            "node delegator 1 balance is not set"
        );
        assertEq(
            ERC20(rETHAddress).balanceOf(address(nodeDelegator1)),
            amountToTransfer,
            "node delegator 1 balance is not set"
        );
    }

    function test_RevertUpdateMaxNodeDelegatorCountWhenNotCalledByLRTConfigAdmin() external {
        vm.prank(stWhale);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.updateMaxNodeDelegatorCount(10);
    }

    function test_UpdateMaxNodeDelegatorCountWhenCalledByAdmin() external {
        vm.startPrank(admin);
        lrtDepositPool.updateMaxNodeDelegatorCount(100);
        vm.stopPrank();

        assertEq(lrtDepositPool.maxNodeDelegatorCount(), 100, "Max node delegator count is not set");
    }

    function test_RevertPauseWhenNotCalledByLRTConfigManager() external {
        vm.prank(stWhale);
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtDepositPool.pause();
    }

    function test_PauseAndUnpauseWhenCalledByManagerAndAdmin() external {
        vm.prank(manager);
        lrtDepositPool.pause();

        assertTrue(lrtDepositPool.paused(), "LRTDepositPool is not paused");

        vm.prank(stWhale); // cannot unpause
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigAdmin.selector);
        lrtDepositPool.unpause();

        vm.prank(admin);
        lrtDepositPool.unpause();

        assertFalse(lrtDepositPool.paused(), "LRTDepositPool is not unpaused");
    }
}

contract LRTConfigIntegrationTest is LRTIntegrationTest {
    function test_LRTConfigSetup() public {
        // tokens
        assertEq(stETHAddress, lrtConfig.getLSTToken(LRTConstants.ST_ETH_TOKEN));
        assertEq(rETHAddress, lrtConfig.getLSTToken(LRTConstants.R_ETH_TOKEN));
        assertEq(cbETHAddress, lrtConfig.getLSTToken(LRTConstants.CB_ETH_TOKEN));
        assertEq(address(rseth), lrtConfig.rsETH());

        assertEq(lrtConfig.depositLimitByAsset(stETHAddress), 100_000 ether);
        assertEq(lrtConfig.depositLimitByAsset(rETHAddress), 100_000 ether);
        assertEq(lrtConfig.depositLimitByAsset(cbETHAddress), 0); // set to 0 for goerli

        assertTrue(lrtConfig.isSupportedAsset(stETHAddress));
        assertTrue(lrtConfig.isSupportedAsset(rETHAddress));
        assertTrue(lrtConfig.isSupportedAsset(cbETHAddress));

        assertEq(vm.envAddress("STETH_STRATEGY"), lrtConfig.assetStrategy(stETHAddress));
        assertEq(vm.envAddress("RETH_STRATEGY"), lrtConfig.assetStrategy(rETHAddress));
        assertEq(vm.envAddress("CBETH_STRATEGY"), lrtConfig.assetStrategy(cbETHAddress));

        assertEq(address(lrtDepositPool), lrtConfig.getContract(LRTConstants.LRT_DEPOSIT_POOL));
        assertEq(address(lrtOracle), lrtConfig.getContract(LRTConstants.LRT_ORACLE));
    }

    function test_LRTConfigIsAlreadyInitialized() public {
        // attempt to initialize LRTConfig again reverts
        vm.expectRevert("Initializable: contract is already initialized");
        lrtConfig.initialize(admin, stETHAddress, rETHAddress, cbETHAddress, address(rseth));
    }

    function test_RevertWhenCallingAddNewAssetByANonLRTManager() external {
        address randomAssetAddress = makeAddr("randomAssetAddress");
        uint256 randomAssetDepositLimit = 100 ether;
        // Example of error message. Unfortunaly vm.expectRevert does not support the result of string casting.
        // string memory errorMessage = string(
        //     abi.encodePacked(
        //         "AccessControl: account ",
        //         Strings.toHexString(address(this)),
        //         " is missing role ",
        //         Strings.toHexString(uint256(LRTConstants.MANAGER), 32)
        //     )
        // );
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0xaf290d8680820aad922855f39b306097b20e28774d6c1ad35a20325630c3a02c"
        );

        lrtConfig.addNewSupportedAsset(randomAssetAddress, randomAssetDepositLimit);
    }

    function test_IsAbleToAddNewAssetByManager() external {
        address randomAssetAddress = makeAddr("randomAssetAddress");
        uint256 randomAssetDepositLimit = 100 ether;

        vm.prank(manager);
        lrtConfig.addNewSupportedAsset(randomAssetAddress, randomAssetDepositLimit);

        assertEq(lrtConfig.depositLimitByAsset(randomAssetAddress), randomAssetDepositLimit);
    }

    function test_RevertUpdateAssetDepositLimitIfNotManager() external {
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0xaf290d8680820aad922855f39b306097b20e28774d6c1ad35a20325630c3a02c"
        );

        lrtConfig.updateAssetDepositLimit(stETHAddress, 1000);
    }

    function test_UpdateAssetDepositLimit() external {
        uint256 depositLimit = 1000;

        vm.startPrank(manager);
        lrtConfig.updateAssetDepositLimit(stETHAddress, depositLimit);

        assertEq(lrtConfig.depositLimitByAsset(stETHAddress), depositLimit);
    }

    function test_RevertUpdateAssetStrategyIfNotAdmin() external {
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.updateAssetStrategy(stETHAddress, address(this));
    }

    function test_RevertWhenAssetIsNotSupported() external {
        address randomToken = makeAddr("randomToken");
        address strategy = makeAddr("strategy");

        vm.startPrank(admin);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        lrtConfig.updateAssetStrategy(address(randomToken), strategy);
        vm.stopPrank();
    }

    function test_RevertWhenStrategyAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.updateAssetStrategy(stETHAddress, address(0));
        vm.stopPrank();
    }

    function test_RevertWhenSameStrategyWasAlreadyAddedBeforeForAsset() external {
        address strategy = lrtConfig.assetStrategy(stETHAddress);
        vm.startPrank(admin);
        // revert when same strategy was already added before for asset
        vm.expectRevert(ILRTConfig.ValueAlreadyInUse.selector);
        lrtConfig.updateAssetStrategy(stETHAddress, strategy);
        vm.stopPrank();
    }

    function test_UpdateAssetStrategy() external {
        address strategy = makeAddr("strategy");

        vm.prank(admin);
        lrtConfig.updateAssetStrategy(stETHAddress, strategy);

        assertEq(lrtConfig.assetStrategy(stETHAddress), strategy);
    }

    function test_RevertSetRSETHIfNotAdmin() external {
        address newRSETH = makeAddr("newRSETH");

        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setRSETH(newRSETH);
    }

    function test_RevertSetRSETHIfRSETHAddressIsZero() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        lrtConfig.setRSETH(address(0));
        vm.stopPrank();
    }

    function test_SetRSETH() external {
        address newRSETH = makeAddr("newRSETH");
        vm.prank(admin);
        lrtConfig.setRSETH(newRSETH);

        assertEq(lrtConfig.rsETH(), newRSETH);
    }

    function test_RevertSetTokenIfNotAdmin() external {
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, address(this));
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

        vm.prank(admin);
        lrtConfig.setToken(LRTConstants.ST_ETH_TOKEN, newToken);

        assertEq(lrtConfig.tokenMap(LRTConstants.ST_ETH_TOKEN), newToken);
    }

    function test_RevertSetContractIfNotAdmin() external {
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, address(this));
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

        vm.prank(admin);
        lrtConfig.setContract(LRTConstants.LRT_ORACLE, newContract);

        assertEq(lrtConfig.contractMap(LRTConstants.LRT_ORACLE), newContract);
    }
}

contract LRTOracleIntegrationTest is LRTIntegrationTest {
    function test_LRTOracleSetup() public {
        address chainlinkOracle = 0x2d81a54C2b722417295F9bF1dE5CEf98690774e9;
        assertEq(lrtOracle.assetPriceOracle(stETHAddress), chainlinkOracle);
        assertEq(lrtOracle.assetPriceOracle(rETHAddress), chainlinkOracle);
        assertEq(lrtOracle.assetPriceOracle(cbETHAddress), chainlinkOracle);
    }

    function test_LRTOracleIsAlreadyInitialized() public {
        // attempt to initialize LRTOracle again reverts
        vm.expectRevert("Initializable: contract is already initialized");
        lrtOracle.initialize(address(lrtConfig));
    }

    function test_RevertWhenCallingUpdatePriceOracleForByANonLRTManager() external {
        address randomAssetAddress = makeAddr("randomAssetAddress");
        address randomPriceOracleAddress = makeAddr("randomPriceOracleAddress");

        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtOracle.updatePriceOracleFor(randomAssetAddress, randomPriceOracleAddress);
    }

    function test_IsAbleToUpdatePriceOracleForAssetByLRTManager() external {
        address randomPriceOracleAddress = makeAddr("randomPriceOracleAddress");

        vm.prank(manager);
        lrtOracle.updatePriceOracleFor(stETHAddress, randomPriceOracleAddress);

        assertEq(lrtOracle.assetPriceOracle(stETHAddress), randomPriceOracleAddress);
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        lrtOracle.pause();
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

    function test_Unpause() external {
        vm.prank(manager);
        lrtOracle.pause();

        assertTrue(lrtOracle.paused(), "Contract is not paused");

        vm.prank(admin);
        lrtOracle.unpause();

        assertFalse(lrtOracle.paused(), "Contract is not unpaused");
    }
}

contract RSETHIntegrationTest is LRTIntegrationTest {
    function test_RSETHIsAlreadyInitialized() public {
        // attempt to initialize RSETH again reverts
        vm.expectRevert("Initializable: contract is already initialized");
        rseth.initialize(address(admin), address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        rseth.pause();
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

    function test_Unpause() external {
        vm.prank(manager);
        rseth.pause();

        assertTrue(rseth.paused(), "Contract is not paused");

        vm.prank(admin);
        rseth.unpause();

        assertFalse(rseth.paused(), "Contract is not unpaused");
    }

    function test_RevertWhenCallingUpdateLRTConfigAndCallerIsNotLRTAdmin() external {
        vm.expectRevert(
            "AccessControl: account 0x7fa9385be102ac3eac297483dd6233d62b3e1496 is missing role 0x0000000000000000000000000000000000000000000000000000000000000000"
        );
        rseth.updateLRTConfig(address(lrtConfig));
    }

    function test_RevertWhenCallingUpdateLRTConfigAndLRTConfigIsZeroAddress() external {
        vm.startPrank(admin);
        vm.expectRevert(UtilLib.ZeroAddressNotAllowed.selector);
        rseth.updateLRTConfig(address(0));
        vm.stopPrank();
    }

    function test_UpdateLRTConfigWhenCallingUpdateLRTConfig() external {
        address newLRTConfigAddress = makeAddr("MockNewLRTConfig");
        ILRTConfig newLRTConfig = ILRTConfig(newLRTConfigAddress);

        vm.prank(admin);
        rseth.updateLRTConfig(address(newLRTConfig));

        assertEq(address(newLRTConfig), address(rseth.lrtConfig()), "LRT config address is not set");
    }
}

contract NodeDelegatorIntegrationTest is LRTIntegrationTest {
    uint256 amountToTransfer;

    function setUp() public override {
        super.setUp();

        amountToTransfer = 10 ether;

        vm.startPrank(stWhale);
        ERC20(stETHAddress).approve(address(lrtDepositPool), amountToTransfer);
        lrtDepositPool.depositAsset(stETHAddress, amountToTransfer);
        vm.stopPrank();

        uint256 indexOfNodeDelegator = 0;

        vm.prank(manager);
        lrtDepositPool.transferAssetToNodeDelegator(indexOfNodeDelegator, stETHAddress, amountToTransfer);
    }

    function test_NodeDelegatorIsAlreadyInitialized() public {
        // attempt to initialize NodeDelegator again reverts
        vm.expectRevert("Initializable: contract is already initialized");
        nodeDelegator1.initialize(address(lrtConfig));
    }

    function test_RevertWhenCallerIsNotLRTManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDelegator1.pause();
    }

    function test_RevertWhenContractIsAlreadyPaused() external {
        vm.startPrank(manager);
        nodeDelegator1.pause();

        vm.expectRevert("Pausable: paused");
        nodeDelegator1.pause();

        vm.stopPrank();
    }

    function test_Pause() external {
        vm.startPrank(manager);
        nodeDelegator1.pause();

        vm.stopPrank();

        assertTrue(nodeDelegator1.paused(), "Contract is not paused");
    }

    function test_Unpause() external {
        vm.prank(manager);
        nodeDelegator1.pause();

        assertTrue(nodeDelegator1.paused(), "Contract is not paused");

        vm.prank(admin);
        nodeDelegator1.unpause();

        assertFalse(nodeDelegator1.paused(), "Contract is not unpaused");
    }

    function test_RevertWhenCallingMaxApproveToEigenStrategyManagerByCallerIsNotLRTManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDelegator1.maxApproveToEigenStrategyManager(stETHAddress);
    }

    function test_RevertWhenAssetIsNotSupportedInMaxApproveToEigenStrategyFunction() external {
        address randomAddress = address(0x123);
        vm.prank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        nodeDelegator1.maxApproveToEigenStrategyManager(randomAddress);
    }

    function test_MaxApproveToEigenStrategyManager() external {
        address eigenlayerStrategyManagerAddress = lrtConfig.getContract(LRTConstants.EIGEN_STRATEGY_MANAGER);

        vm.prank(manager);
        nodeDelegator1.maxApproveToEigenStrategyManager(stETHAddress);

        // check that the nodeDelegator has max approved the eigen strategy manager
        assertEq(
            ERC20(stETHAddress).allowance(address(nodeDelegator1), eigenlayerStrategyManagerAddress), type(uint256).max
        );
    }

    function test_RevertWhenCallingDepositAssetIntoStrategyAndNodeDelegatorIsPaused() external {
        vm.startPrank(manager);
        nodeDelegator1.pause();

        vm.expectRevert("Pausable: paused");
        nodeDelegator1.depositAssetIntoStrategy(stETHAddress);

        vm.stopPrank();
    }

    function test_RevertWhenAssetIsNotSupportedInDepositAssetIntoStrategyFunction() external {
        address randomAddress = address(0x123);
        vm.prank(manager);
        vm.expectRevert(ILRTConfig.AssetNotSupported.selector);
        nodeDelegator1.depositAssetIntoStrategy(randomAddress);
    }

    function test_RevertWhenCallingDepositAssetIntoStrategyAndCallerIsNotManager() external {
        vm.expectRevert(ILRTConfig.CallerNotLRTConfigManager.selector);
        nodeDelegator1.depositAssetIntoStrategy(stETHAddress);
    }

    function test_DepositAssetIntoStrategyFromNodeDelegator() external {
        console.log(
            "nodeDel stETH balance before submitting to strategy:",
            ERC20(stETHAddress).balanceOf(address(nodeDelegator1))
        );

        (uint256 assetLyingInDepositPool, uint256 assetLyingInNDCs, uint256 assetStakedInEigenLayer) =
            lrtDepositPool.getAssetDistributionData(stETHAddress);

        console.log("#######");
        console.log("getAssetDistributionData for stETH BEFORE submitting funds to strategy");
        console.log("assetLyingInDepositPool", assetLyingInDepositPool);
        console.log("assetLyingInNDCs", assetLyingInNDCs);
        console.log("assetStakedInEigenLayer", assetStakedInEigenLayer);
        console.log("#######");

        address eigenlayerSTETHStrategyAddress = lrtConfig.assetStrategy(stETHAddress);
        uint256 balanceOfStrategyBefore = ERC20(stETHAddress).balanceOf(eigenlayerSTETHStrategyAddress);
        console.log("balanceOfStrategyBefore", balanceOfStrategyBefore);

        vm.startPrank(manager);
        nodeDelegator1.maxApproveToEigenStrategyManager(stETHAddress);
        nodeDelegator1.depositAssetIntoStrategy(stETHAddress);
        vm.stopPrank();

        uint256 balanceOfStrategyAfter = ERC20(stETHAddress).balanceOf(eigenlayerSTETHStrategyAddress);
        console.log("balanceOfStrategyAfter", balanceOfStrategyAfter);

        console.log("stETH amount submitted to strategy", balanceOfStrategyAfter - balanceOfStrategyBefore);

        (assetLyingInDepositPool, assetLyingInNDCs, assetStakedInEigenLayer) =
            lrtDepositPool.getAssetDistributionData(stETHAddress);
        console.log("#######");
        console.log("getAssetDistributionData for stETH AFTER submitting funds to strategy");
        console.log("assetLyingInDepositPool", assetLyingInDepositPool);
        console.log("assetLyingInNDCs", assetLyingInNDCs);
        console.log("assetStakedInEigenLayer", assetStakedInEigenLayer);

        assertGt(
            balanceOfStrategyAfter,
            balanceOfStrategyBefore,
            "Balance of strategy after is not greater than balance of strategy before tx"
        );
    }
}
