// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

interface ILRTDepositPool {
    //errors
    error TokenTransferFailed();
    error InvalidAmount();
    error NotEnoughAssetToTransfer();
    error MaximumDepositLimitReached();
    error MaximumNodeDelegatorCountReached();

    //events
    event MaxNodeDelegatorCountUpdated(uint256 maxNodeDelegatorCount);
    event NodeDelegatorAddedinQueue(address prospectiveNodeDelegatorContract);
    event AssetDeposit(address asset, uint256 depositAmount, uint256 rsethMintAmount);

    function depositAsset(address asset, uint256 depositAmount) external;

    function getTotalAssetDeposits(address asset) external view returns (uint256);

    function getAssetCurrentLimit(address asset) external view returns (uint256);

    function getRsETHAmountToMint(address asset, uint256 depositAmount) external view returns (uint256);

    function addNodeDelegatorContractToQueue(address[] calldata nodeDelegatorContract) external;

    function transferAssetToNodeDelegator(uint256 ndcIndex, address asset, uint256 amount) external;

    function updateMaxNodeDelegatorCount(uint256 maxNodeDelegatorCount) external;

    function getNodeDelegatorQueue() external view returns (address[] memory);

    function getAssetDistributionData(address asset)
        external
        view
        returns (uint256 assetLyingInDepositPool, uint256 assetLyingInNDCs, uint256 assetStakedInEigenLayer);
}
