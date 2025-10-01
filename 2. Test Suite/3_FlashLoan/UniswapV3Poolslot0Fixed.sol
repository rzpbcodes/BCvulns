// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IUniswapV3Pool {
    function observe(uint32[] calldata secondsAgos) external view returns (
        int56[] memory tickCumulatives,
        uint160[] memory secondsPerLiquidityCumulativeX128s
    );
}

interface ITickMath {
    function getSqrtRatioAtTick(int24 tick) external pure returns (uint160);
    function getTickAtSqrtRatio(uint160 sqrtPriceX96) external pure returns (int24);
}

contract UniswapV3Poolslot0Fixed {
    IUniswapV3Pool public immutable uniswapPool;
    ITickMath public immutable tickMath;
    uint32 public constant TWAP_INTERVAL = 3600; // 1-hour TWAP

    constructor(address _pool, address _tickMath) {
        uniswapPool = IUniswapV3Pool(_pool);
        tickMath = ITickMath(_tickMath);
    }

    function getTWAPPrice() external view returns (uint256 price) {
        uint32[] memory timePoints;
        timePoints[0] = TWAP_INTERVAL; // 1 hour ago
        timePoints[1] = 0; // Now

        (int56[] memory tickCumulatives, ) = uniswapPool.observe(timePoints);

        int56 tickDifference = tickCumulatives[1] - tickCumulatives[0];
        int56 averageTick = tickDifference / int56(uint56(TWAP_INTERVAL));

        uint160 sqrtPriceX96 = tickMath.getSqrtRatioAtTick(int24(averageTick));
        price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2);
    }
}
