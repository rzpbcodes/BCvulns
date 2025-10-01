// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// https://github.com/Uniswap/v2-periphery/blob/master/contracts/examples/ExampleOracleSimple.sol
// https://github.com/Uniswap/v2-periphery/blob/master/contracts/examples/ExampleOracleSimple.sol

interface IUniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function price0CumulativeLast() external view returns (uint256);
    function price1CumulativeLast() external view returns (uint256);
}

contract UniswapV2getReservesFixed {
    IUniswapV2Pair public immutable uniswapPair;
    address public immutable tokenA;
    address public immutable tokenB;

    uint256 public lastPrice0Cumulative;
    uint256 public lastPrice1Cumulative;
    uint32 public lastTimestamp;

    constructor(address _pair) {
        uniswapPair = IUniswapV2Pair(_pair);
        tokenA = uniswapPair.token0();
        tokenB = uniswapPair.token1();

        // Initialize with the latest cumulative prices
        lastPrice0Cumulative = uniswapPair.price0CumulativeLast();
        lastPrice1Cumulative = uniswapPair.price1CumulativeLast();
        (, , lastTimestamp) = uniswapPair.getReserves();
    }

    function updateTWAP() public {
        uint256 currentPrice0Cumulative = uniswapPair.price0CumulativeLast();
        uint256 currentPrice1Cumulative = uniswapPair.price1CumulativeLast();
        (, , uint32 currentTimestamp) = uniswapPair.getReserves();

        uint32 timeElapsed = currentTimestamp - lastTimestamp;
        require(timeElapsed > 0, "Not enough time has passed");

        lastPrice0Cumulative = currentPrice0Cumulative;
        lastPrice1Cumulative = currentPrice1Cumulative;
        lastTimestamp = currentTimestamp;
    }

    function getTWAPPrice() public view returns (uint256 price) {
        uint256 currentPrice0Cumulative = uniswapPair.price0CumulativeLast();
        uint256 currentPrice1Cumulative = uniswapPair.price1CumulativeLast();
        (, , uint32 currentTimestamp) = uniswapPair.getReserves();

        uint32 timeElapsed = currentTimestamp - lastTimestamp;
        require(timeElapsed > 0, "No time elapsed");

        uint256 price0TWAP = (currentPrice0Cumulative - lastPrice0Cumulative) / timeElapsed;
        uint256 price1TWAP = (currentPrice1Cumulative - lastPrice1Cumulative) / timeElapsed;

        // Return the TWAP price
        if (tokenA == address(this)) {
            return price0TWAP; // Price of tokenA in terms of tokenB
        } else {
            return price1TWAP; // Price of tokenB in terms of tokenA
        }
    }
}
