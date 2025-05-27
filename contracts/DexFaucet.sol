// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DEXFaucet is Ownable {
    IERC20 public tdecsToken;
    IERC20 public tdexToken;

    constructor(address _tdecsToken, address _tdexToken) {
        tdecsToken = IERC20(_tdecsToken);
        tdexToken = IERC20(_tdexToken);
    }

    function requestFaucet(address recipient) external onlyOwner {
        require(recipient != address(0), "Invalid recipient address");

        // Transfer 500 tokens of TDECS and TDEX to the recipient
        tdecsToken.transfer(recipient, 500 ether);
        tdexToken.transfer(recipient, 500 ether);
    }
}
