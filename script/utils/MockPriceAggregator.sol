// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.21;

contract MockPriceAggregator {
    uint256 public price;

    constructor() {
        price = 1 ether;
    }

    function latestAnswer() external view returns (uint256) {
        return price;
    }

    function setPrice(uint256 price_) external {
        price = price_;
    }
}
