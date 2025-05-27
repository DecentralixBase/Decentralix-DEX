// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DexSwap is Ownable {
    // Declare the addresses of the tokens you want to support
    address public tokenA; // Address of Token A (TDES)
    address public tokenB; // Address of Token B (TDEX)

    constructor(address _tokenA, address _tokenB) {
        tokenA = _tokenA;
        tokenB = _tokenB;
    }

    // Swap function to exchange Token A for Token B
    function swapTokens(uint256 amountIn) external {
        // Ensure the sender has approved this contract to spend Token A
        IERC20(tokenA).transferFrom(msg.sender, address(this), amountIn);

        // Perform the swap logic (for simplicity, we assume a 1:1 swap)
        uint256 amountOut = amountIn;

        // Transfer Token B to the sender
        IERC20(tokenB).transfer(msg.sender, amountOut);
    }

    // Owner-only function to withdraw any tokens sent to this contract
    function withdrawTokens(address tokenAddress, uint256 amount) external onlyOwner {
        IERC20(tokenAddress).transfer(owner(), amount);
    }
}
