// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.21;

import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";

interface IRSETH is IERC20 {
    function mint(address account, uint256 amount) external;

    function burn(address account, uint256 amount) external;
}
