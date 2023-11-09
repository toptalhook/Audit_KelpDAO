// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

interface IPriceFetcher {
    // events
    event AssetPriceFeedUpdate(address indexed asset, address indexed priceFeed);

    function getAssetPrice(address asset) external view returns (uint256);
    function assetPriceFeed(address asset) external view returns (address);
}
