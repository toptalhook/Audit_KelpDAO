// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

import { UtilLib } from "./utils/UtilLib.sol";
import { LRTConfigRoleChecker, ILRTConfig } from "./utils/LRTConfigRoleChecker.sol";

import { ERC20Upgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

/// @title rsETH token Contract
/// @author Stader Labs
/// @notice The ERC20 contract for the rsETH token
contract RSETH is
    Initializable,
    LRTConfigRoleChecker,
    ERC20Upgradeable,
    PausableUpgradeable,
    AccessControlUpgradeable
{
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /// @dev Initializes the contract
    /// @param admin Admin address
    /// @param lrtConfigAddr LRT config address
    function initialize(address admin, address lrtConfigAddr) external initializer {
        UtilLib.checkNonZeroAddress(admin);
        UtilLib.checkNonZeroAddress(lrtConfigAddr);

        __ERC20_init("rsETH", "rsETH");
        __Pausable_init();
        __AccessControl_init();
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        lrtConfig = ILRTConfig(lrtConfigAddr);
        emit UpdatedLRTConfig(lrtConfigAddr);
    }

    /// @notice Mints rsETH when called by an authorized caller
    /// @param to the account to mint to
    /// @param amount the amount of rsETH to mint
    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) whenNotPaused {
        _mint(to, amount);
    }

    /// @notice Burns rsETH when called by an authorized caller
    /// @param account the account to burn from
    /// @param amount the amount of rsETH to burn
    function burnFrom(address account, uint256 amount) external onlyRole(BURNER_ROLE) whenNotPaused {
        _burn(account, amount);
    }

    /// @dev Triggers stopped state.
    /// @dev Only callable by LRT config manager. Contract must NOT be paused.
    function pause() external onlyLRTManager {
        _pause();
    }

    /// @notice Returns to normal state.
    /// @dev Only callable by the rsETH admin. Contract must be paused
    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {
        _unpause();
    }

    /// @notice Updates the LRT config contract
    /// @dev only callable by the rsETH admin
    /// @param _lrtConfig the new LRT config contract
    function updateLRTConfig(address _lrtConfig) external override onlyRole(DEFAULT_ADMIN_ROLE) {
        UtilLib.checkNonZeroAddress(_lrtConfig);
        lrtConfig = ILRTConfig(_lrtConfig);
        emit UpdatedLRTConfig(_lrtConfig);
    }
}
