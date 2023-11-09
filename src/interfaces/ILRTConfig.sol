// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

interface ILRTConfig {
    // Errors
    error ValueAlreadyInUse();
    error AssetAlreadySupported();
    error AssetNotSupported();
    error CallerNotLRTConfigAdmin();
    error CallerNotLRTConfigManager();

    // Events
    event SetToken(bytes32 key, address tokenAddr);
    event SetContract(bytes32 key, address contractAddr);
    event AddedNewSupportedAsset(address asset, uint256 depositLimit);
    event RemovedSupportedAsset(address asset);
    event AssetDepositLimitUpdate(address asset, uint256 depositLimit);

    // methods

    function rsETH() external view returns (address);

    function assetStrategy(address asset) external view returns (address);

    function isSupportedAsset(address asset) external view returns (bool);

    function getLSTToken(bytes32 tokenId) external view returns (address);

    function getContract(bytes32 contractId) external view returns (address);

    function getSupportedAssetList() external view returns (address[] memory);

    function depositLimitByAsset(address asset) external view returns (uint256);
}
