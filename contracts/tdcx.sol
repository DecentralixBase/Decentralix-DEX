// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestDCX is ERC20 {
    constructor() ERC20("TestDCX", "TDCX") {
        uint256 initialSupply = 1_000_000_000 * 10**uint256(decimals()); // 1 billion tokens with 18 decimal places
        _mint(msg.sender, initialSupply);
    }
}
