// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// use of IUniswapV2Pair.getReserves() function is vulnerable to flash loan attacks
// https://solodit.cyfrin.io/issues/m-04-fallback-oracle-is-using-spot-price-in-uniswap-liquidity-pool-which-is-very-vulnerable-to-flashloan-price-manipulation-code4rena-paraspace-paraspace-contest-git

interface IUniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32);
    function token0() external view returns (address);
    function token1() external view returns (address);
}

contract UniswapV2getReserves {
    IUniswapV2Pair public uniswapPair;
    address public tokenA;
    address public tokenB;

    constructor(address _pair) {
        uniswapPair = IUniswapV2Pair(_pair);
        tokenA = uniswapPair.token0();
        tokenB = uniswapPair.token1();
    }

    function getUniswapPrice() public view returns (uint256) {
        // getReserves() is Vulnerable to flash loans
        (uint112 reserve0, uint112 reserve1, ) = uniswapPair.getReserves();
        return (uint256(reserve1) * 1e18) / uint256(reserve0); 
    }
}
