// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

library LRTConstants {
    //tokens
    //rETH token
    bytes32 public constant R_ETH_TOKEN = keccak256("R_ETH_TOKEN");
    //stETH token
    bytes32 public constant ST_ETH_TOKEN = keccak256("ST_ETH_TOKEN");
    //cbETH token
    bytes32 public constant CB_ETH_TOKEN = keccak256("CB_ETH_TOKEN");

    //contracts
    bytes32 public constant LRT_ORACLE = keccak256("LRT_ORACLE");
    bytes32 public constant LRT_DEPOSIT_POOL = keccak256("LRT_DEPOSIT_POOL");
    bytes32 public constant EIGEN_STRATEGY_MANAGER = keccak256("EIGEN_STRATEGY_MANAGER");

    //Roles
    bytes32 public constant MANAGER = keccak256("MANAGER");
}
