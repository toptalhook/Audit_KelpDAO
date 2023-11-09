// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import "forge-std/Script.sol";

import { LRTConfig, LRTConstants } from "src/LRTConfig.sol";
import { RSETH } from "src/RSETH.sol";
import { LRTDepositPool } from "src/LRTDepositPool.sol";
import { LRTOracle } from "src/LRTOracle.sol";
import { ChainlinkPriceOracle } from "src/oracles/ChainlinkPriceOracle.sol";
import { NodeDelegator } from "src/NodeDelegator.sol";

import { ProxyFactory } from "script/utils/ProxyFactory.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import { MockPriceAggregator } from "script/utils/MockPriceAggregator.sol";

function getLSTs() view returns (address stETH, address rETH, address cbETH) {
    uint256 chainId = block.chainid;

    if (chainId == 1) {
        // mainnet
        stETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
        rETH = 0xae78736Cd615f374D3085123A210448E74Fc6393;
        cbETH = 0xBe9895146f7AF43049ca1c1AE358B0541Ea49704;
    } else if (chainId == 5) {
        // goerli
        stETH = 0x1643E812aE58766192Cf7D2Cf9567dF2C37e9B7F;
        rETH = 0x178E141a0E3b34152f73Ff610437A7bf9B83267A;
        cbETH = 0x298aFB19A105D59E74658C4C334Ff360BadE6dd2; // (tseth) random address as it is not supported by eigen
            // layer on goerli
    } else {
        revert("Unsupported network");
    }
}

contract DeployLRT is Script {
    address public proxyAdminOwner;
    ProxyAdmin public proxyAdmin;

    ProxyFactory public proxyFactory;

    LRTConfig public lrtConfigProxy;
    RSETH public RSETHProxy;
    LRTDepositPool public lrtDepositPoolProxy;
    LRTOracle public lrtOracleProxy;
    ChainlinkPriceOracle public chainlinkPriceOracleProxy;
    NodeDelegator public nodeDelegatorProxy1;
    NodeDelegator public nodeDelegatorProxy2;
    NodeDelegator public nodeDelegatorProxy3;
    NodeDelegator public nodeDelegatorProxy4;
    NodeDelegator public nodeDelegatorProxy5;
    address[] public nodeDelegatorContracts;

    function maxApproveToEigenStrategyManager(address nodeDel) private {
        (address stETH, address rETH, address cbETH) = getLSTs();
        NodeDelegator(nodeDel).maxApproveToEigenStrategyManager(stETH);
        NodeDelegator(nodeDel).maxApproveToEigenStrategyManager(rETH);
        NodeDelegator(nodeDel).maxApproveToEigenStrategyManager(cbETH);
    }

    function getAssetStrategies()
        private
        view
        returns (address strategyManager, address stETHStrategy, address rETHStrategy, address cbETHStrategy)
    {
        strategyManager = vm.envAddress("EIGEN_STRATEGY_MANAGER");
        stETHStrategy = vm.envAddress("STETH_STRATEGY");
        rETHStrategy = vm.envAddress("RETH_STRATEGY");
        cbETHStrategy = vm.envAddress("CBETH_STRATEGY");
    }

    function getPriceFeeds() private returns (address stETHPriceFeed, address rETHPriceFeed, address cbETHPriceFeed) {
        uint256 chainId = block.chainid;

        if (chainId == 1) {
            // mainnet
            stETHPriceFeed = vm.envAddress("RETH_PRICE_FEED");
            rETHPriceFeed = vm.envAddress("STETH_PRICE_FEED");
            cbETHPriceFeed = vm.envAddress("CBTETH_PRICE_FEED");
        } else {
            // testnet
            stETHPriceFeed = address(new MockPriceAggregator());
            rETHPriceFeed = address(new MockPriceAggregator());
            cbETHPriceFeed = address(new MockPriceAggregator());
        }
    }

    function setUpByAdmin() private {
        (address stETH, address rETH, address cbETH) = getLSTs();
        // ----------- callable by admin ----------------

        // add rsETH to LRT config
        lrtConfigProxy.setRSETH(address(RSETHProxy));
        // add oracle to LRT config
        lrtConfigProxy.setContract(LRTConstants.LRT_ORACLE, address(lrtOracleProxy));
        // add deposit pool to LRT config
        lrtConfigProxy.setContract(LRTConstants.LRT_DEPOSIT_POOL, address(lrtDepositPoolProxy));
        // call updateAssetStrategy for each asset in LRTConfig
        (address strategyManager, address stETHStrategy, address rETHStrategy, address cbETHStrategy) =
            getAssetStrategies();
        lrtConfigProxy.setContract(LRTConstants.EIGEN_STRATEGY_MANAGER, strategyManager);
        lrtConfigProxy.updateAssetStrategy(stETH, stETHStrategy);
        lrtConfigProxy.updateAssetStrategy(rETH, rETHStrategy);
        lrtConfigProxy.updateAssetStrategy(cbETH, cbETHStrategy);

        // grant MANAGER_ROLE to an address in LRTConfig
        lrtConfigProxy.grantRole(LRTConstants.MANAGER, proxyAdminOwner); // TODO: change it later to a multisig
        // add minter role to lrtDepositPool so it mint rsETH
        RSETHProxy.grantRole(RSETHProxy.MINTER_ROLE(), address(lrtDepositPoolProxy));

        // add nodeDelegators to LRTDepositPool queue
        nodeDelegatorContracts.push(address(nodeDelegatorProxy1));
        nodeDelegatorContracts.push(address(nodeDelegatorProxy2));
        nodeDelegatorContracts.push(address(nodeDelegatorProxy3));
        nodeDelegatorContracts.push(address(nodeDelegatorProxy4));
        nodeDelegatorContracts.push(address(nodeDelegatorProxy5));
        lrtDepositPoolProxy.addNodeDelegatorContractToQueue(nodeDelegatorContracts);
    }

    function setUpByManager() private {
        (address stETH, address rETH, address cbETH) = getLSTs();
        // --------- callable by manager -----------

        // Add chainlink oracles for supported assets in ChainlinkPriceOracle
        (address stETHPriceFeed, address rETHPriceFeed, address cbETHPriceFeed) = getPriceFeeds();

        chainlinkPriceOracleProxy.updatePriceFeedFor(stETH, stETHPriceFeed);
        chainlinkPriceOracleProxy.updatePriceFeedFor(rETH, rETHPriceFeed);
        chainlinkPriceOracleProxy.updatePriceFeedFor(cbETH, cbETHPriceFeed);

        // call updatePriceOracleFor for each asset in LRTOracle
        lrtOracleProxy.updatePriceOracleFor(address(stETH), address(chainlinkPriceOracleProxy));
        lrtOracleProxy.updatePriceOracleFor(address(rETH), address(chainlinkPriceOracleProxy));
        lrtOracleProxy.updatePriceOracleFor(address(cbETH), address(chainlinkPriceOracleProxy));

        // maxApproveToEigenStrategyManager in each NodeDelegator to transfer to strategy
        maxApproveToEigenStrategyManager(address(nodeDelegatorProxy1));
        maxApproveToEigenStrategyManager(address(nodeDelegatorProxy2));
        maxApproveToEigenStrategyManager(address(nodeDelegatorProxy3));
        maxApproveToEigenStrategyManager(address(nodeDelegatorProxy4));
        maxApproveToEigenStrategyManager(address(nodeDelegatorProxy5));

        // check if depositLimit for each asset is correct.
        lrtConfigProxy.updateAssetDepositLimit(cbETH, 0);
    }

    function run() external {
        vm.startBroadcast();
        proxyAdminOwner = msg.sender; // TODO: change to multisig when deploying to production

        bytes32 salt = keccak256(abi.encodePacked("LRT-Stader-Labs"));
        proxyFactory = new ProxyFactory();
        proxyAdmin = new ProxyAdmin(); // msg.sender becomes the owner of ProxyAdmin

        console.log("ProxyAdmin deployed at: ", address(proxyAdmin));
        console.log("Owner of ProxyAdmin: ", proxyAdmin.owner());

        console.log("ProxyAdmin deployed at: ", address(proxyAdmin));
        console.log("Owner of ProxyAdmin: ", proxyAdminOwner);

        // deploy implementation contracts
        address lrtConfigImplementation = address(new LRTConfig());
        address RSETHImplementation = address(new RSETH());
        address lrtDepositPoolImplementation = address(new LRTDepositPool());
        address lrtOracleImplementation = address(new LRTOracle());
        address chainlinkPriceOracleImplementation = address(new ChainlinkPriceOracle());
        address nodeDelegatorImplementation = address(new NodeDelegator());

        console.log("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        console.log("LRTConfig implementation deployed at: ", lrtConfigImplementation);
        console.log("RSETH implementation deployed at: ", RSETHImplementation);
        console.log("LRTDepositPool implementation deployed at: ", lrtDepositPoolImplementation);
        console.log("LRTOracle implementation deployed at: ", lrtOracleImplementation);
        console.log("ChainlinkPriceOracle implementation deployed at: ", chainlinkPriceOracleImplementation);
        console.log("NodeDelegator implementation deployed at: ", nodeDelegatorImplementation);
        console.log("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");

        // deploy proxy contracts and initialize them
        lrtConfigProxy = LRTConfig(proxyFactory.create(address(lrtConfigImplementation), address(proxyAdmin), salt));

        // set up LRTConfig init params
        (address stETH, address rETH, address cbETH) = getLSTs();
        address predictedRSETHAddress = proxyFactory.computeAddress(RSETHImplementation, address(proxyAdmin), salt);
        console.log("predictedRSETHAddress: ", predictedRSETHAddress);
        // init LRTConfig
        lrtConfigProxy.initialize(proxyAdminOwner, stETH, rETH, cbETH, predictedRSETHAddress);

        RSETHProxy = RSETH(proxyFactory.create(address(RSETHImplementation), address(proxyAdmin), salt));
        // init RSETH
        RSETHProxy.initialize(proxyAdminOwner, address(lrtConfigProxy));

        lrtDepositPoolProxy =
            LRTDepositPool(proxyFactory.create(address(lrtDepositPoolImplementation), address(proxyAdmin), salt));
        // init LRTDepositPool
        lrtDepositPoolProxy.initialize(address(lrtConfigProxy));

        lrtOracleProxy = LRTOracle(proxyFactory.create(address(lrtOracleImplementation), address(proxyAdmin), salt));
        // init LRTOracle
        lrtOracleProxy.initialize(address(lrtConfigProxy));

        chainlinkPriceOracleProxy = ChainlinkPriceOracle(
            proxyFactory.create(address(chainlinkPriceOracleImplementation), address(proxyAdmin), salt)
        );
        // init ChainlinkPriceOracle
        chainlinkPriceOracleProxy.initialize(address(lrtConfigProxy));

        nodeDelegatorProxy1 =
            NodeDelegator(proxyFactory.create(address(nodeDelegatorImplementation), address(proxyAdmin), salt));
        bytes32 saltForNodeDelegator2 = keccak256(abi.encodePacked("LRT-Stader-Labs-nodeDelegator2"));
        nodeDelegatorProxy2 = NodeDelegator(
            proxyFactory.create(address(nodeDelegatorImplementation), address(proxyAdmin), saltForNodeDelegator2)
        );
        bytes32 saltForNodeDelegator3 = keccak256(abi.encodePacked("LRT-Stader-Labs-nodeDelegator3"));
        nodeDelegatorProxy3 = NodeDelegator(
            proxyFactory.create(address(nodeDelegatorImplementation), address(proxyAdmin), saltForNodeDelegator3)
        );
        bytes32 saltForNodeDelegator4 = keccak256(abi.encodePacked("LRT-Stader-Labs-nodeDelegator4"));
        nodeDelegatorProxy4 = NodeDelegator(
            proxyFactory.create(address(nodeDelegatorImplementation), address(proxyAdmin), saltForNodeDelegator4)
        );
        bytes32 saltForNodeDelegator5 = keccak256(abi.encodePacked("LRT-Stader-Labs-nodeDelegator5"));
        nodeDelegatorProxy5 = NodeDelegator(
            proxyFactory.create(address(nodeDelegatorImplementation), address(proxyAdmin), saltForNodeDelegator5)
        );
        // init NodeDelegator
        nodeDelegatorProxy1.initialize(address(lrtConfigProxy));
        nodeDelegatorProxy2.initialize(address(lrtConfigProxy));
        nodeDelegatorProxy3.initialize(address(lrtConfigProxy));
        nodeDelegatorProxy4.initialize(address(lrtConfigProxy));
        nodeDelegatorProxy5.initialize(address(lrtConfigProxy));

        console.log("LRTConfig proxy deployed at: ", address(lrtConfigProxy));
        console.log("RSETH proxy deployed at: ", address(RSETHProxy));
        console.log("LRTDepositPool proxy deployed at: ", address(lrtDepositPoolProxy));
        console.log("LRTOracle proxy deployed at: ", address(lrtOracleProxy));
        console.log("ChainlinkPriceOracle proxy deployed at: ", address(chainlinkPriceOracleProxy));
        console.log("NodeDelegator proxy 1 deployed at: ", address(nodeDelegatorProxy1));
        console.log("NodeDelegator proxy 2 deployed at: ", address(nodeDelegatorProxy2));
        console.log("NodeDelegator proxy 3 deployed at: ", address(nodeDelegatorProxy3));
        console.log("NodeDelegator proxy 4 deployed at: ", address(nodeDelegatorProxy4));
        console.log("NodeDelegator proxy 5 deployed at: ", address(nodeDelegatorProxy5));

        // setup
        setUpByAdmin();
        setUpByManager();

        vm.stopBroadcast();
    }
}
