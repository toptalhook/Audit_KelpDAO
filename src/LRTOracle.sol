// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

import { UtilLib } from "./utils/UtilLib.sol";
import { LRTConstants } from "./utils/LRTConstants.sol";
import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

import { IRSETH } from "./interfaces/IRSETH.sol";
import { IPriceFetcher } from "./interfaces/IPriceFetcher.sol";
import { ILRTOracle } from "./interfaces/ILRTOracle.sol";
import { ILRTDepositPool } from "./interfaces/ILRTDepositPool.sol";
import { INodeDelegator } from "./interfaces/INodeDelegator.sol";

import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";
import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

/// @title LRTOracle Contract
/// @notice oracle contract that calculates the exchange rate of assets
contract LRTOracle is ILRTOracle, LRTConfigRoleChecker, PausableUpgradeable {
    mapping(address asset => address priceOracle) public override assetPriceOracle;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /// @dev Initializes the contract
    /// @param lrtConfigAddr LRT config address
    function initialize(address lrtConfigAddr) external initializer {
        UtilLib.checkNonZeroAddress(lrtConfigAddr);
        __Pausable_init();

        lrtConfig = ILRTConfig(lrtConfigAddr);
        emit UpdatedLRTConfig(lrtConfigAddr);
    }

    /*//////////////////////////////////////////////////////////////
                            view functions
    //////////////////////////////////////////////////////////////*/

    /// @notice Provides Asset/ETH exchange rate
    /// @dev reads from priceFetcher interface which may fetch price from any supported oracle
    /// @param asset the asset for which exchange rate is required
    /// @return assetPrice exchange rate of asset
    function getAssetPrice(address asset) public view onlySupportedAsset(asset) returns (uint256) {
        return IPriceFetcher(assetPriceOracle[asset]).getAssetPrice(asset);
    }

    /// @notice Provides RSETH/ETH exchange rate
    /// @dev calculates based on stakedAsset value received from eigen layer
    /// @return rsETHPrice exchange rate of RSETH
    function getRSETHPrice() external view returns (uint256 rsETHPrice) {// @audit underflow, overflow, round up possible
        address rsETHTokenAddress = lrtConfig.rsETH();
        uint256 rsEthSupply = IRSETH(rsETHTokenAddress).totalSupply();

        if (rsEthSupply == 0) {
            return 1 ether;
        }

        uint256 totalETHInPool;
        address lrtDepositPoolAddr = lrtConfig.getContract(LRTConstants.LRT_DEPOSIT_POOL);

        address[] memory supportedAssets = lrtConfig.getSupportedAssetList();
        uint256 supportedAssetCount = supportedAssets.length;

        for (uint16 asset_idx; asset_idx < supportedAssetCount;) {
            address asset = supportedAssets[asset_idx];
            uint256 assetER = getAssetPrice(asset);

            uint256 totalAssetAmt = ILRTDepositPool(lrtDepositPoolAddr).getTotalAssetDeposits(asset);
            totalETHInPool += totalAssetAmt * assetER;

            unchecked {
                ++asset_idx;
            }
        }

        return totalETHInPool / rsEthSupply;
    }

    /*//////////////////////////////////////////////////////////////
                            write functions
    //////////////////////////////////////////////////////////////*/

    /// @dev add/update the price oracle of any supported asset
    /// @dev only LRTManager is allowed
    /// @param asset asset address for which oracle price needs to be added/updated
    function updatePriceOracleFor(
        address asset,
        address priceOracle
    )
        external
        onlyLRTManager
        onlySupportedAsset(asset)
    {
        UtilLib.checkNonZeroAddress(priceOracle);
        assetPriceOracle[asset] = priceOracle;
        emit AssetPriceOracleUpdate(asset, priceOracle);
    }

    /// @dev Triggers stopped state. Contract must not be paused.
    function pause() external onlyLRTManager {
        _pause();
    }

    /// @dev Returns to normal state. Contract must be paused
    function unpause() external onlyLRTAdmin {
        _unpause();
    }
}
