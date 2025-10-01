// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// use of IUniswapV3Pool.slot0() function is vulnerable to flash loan attacks
// https://solodit.cyfrin.io/issues/on-chain-slippage-calculation-using-exchange-rate-derived-from-poolslot0-can-be-easily-manipulated-cyfrin-none-cyfrin-thermae-markdown

interface IUniswapV3Pool {
    function slot0() external view returns (
        uint160 sqrtPriceX96, // Price √P in Q64.96 format
        int24 tick,
        uint16 observationIndex,
        uint16 observationCardinality,
        uint16 observationCardinalityNext,
        uint8 feeProtocol,
        bool unlocked
    );
}

contract UniswapV3Poolslot0 {
    IUniswapV3Pool public uniswapPool;

    constructor(address _pool) {
        uniswapPool = IUniswapV3Pool(_pool);
    }

    function getUniswapPrice() public view returns (uint256 price) {
        (uint160 sqrtPriceX96, , , , , , ) = uniswapPool.slot0();
        price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2); // 🚨 Vulnerable to flash loans
    }
}
