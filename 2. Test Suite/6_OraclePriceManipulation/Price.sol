// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface AggregatorV3Interface {
    function latestRoundData() external view returns (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound);
}

contract Price {
    AggregatorV3Interface private priceSource;

    constructor(address feedAddress) {
        priceSource = AggregatorV3Interface(feedAddress);
    }

    function fetchCurrentPrice() public view returns (int256) {
        // Fetching only the price part of the latest round data
        (, int256 currentPrice, , , ) = priceSource.latestRoundData();
        return currentPrice;
    }
}
