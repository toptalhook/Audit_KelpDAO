// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

import "forge-std/Script.sol";
import { ITransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { ProxyAdmin } from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

// import contract to be upgraded
// e.g. import "src/LRTConfig.sol";
import { NodeDelegator } from "src/NodeDelegator.sol";

contract UpgradeLRT is Script {
    ProxyAdmin public proxyAdmin;

    address public proxyAddress;
    address public newImplementation;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey); // must be the ProxyAdmin owner

        uint256 chainId = block.chainid;
        if (chainId == 1) {
            // mainnet
            proxyAdmin = ProxyAdmin(address(0));
            proxyAddress = address(0);
            newImplementation = address(0);
        } else if (chainId == 5) {
            // goerli
            proxyAdmin = ProxyAdmin(0x8F616f0994d2648AB34E6Bc676816031fBc9b4a2);
            proxyAddress = 0xC1fDd637EcB96f0b84c8CD97e4386f1634f89b81; // example NodeDelegatorProxy1
            newImplementation = address(new NodeDelegator());
        } else {
            revert("Unsupported network");
        }

        // upgrade contract
        proxyAdmin.upgrade(ITransparentUpgradeableProxy(proxyAddress), newImplementation);

        vm.stopBroadcast();
    }
}
