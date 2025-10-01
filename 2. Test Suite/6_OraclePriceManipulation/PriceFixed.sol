// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface AggregatorV3Interface {
    function latestRoundData() external view returns (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound);
}

contract PriceFixed {
    AggregatorV3Interface private feedSource;

    constructor(address oracleAddress) {
        feedSource = AggregatorV3Interface(oracleAddress);
    }

    function retrieveLatestPrice() public view returns (int256) {
        // Fetch latest round data from the feed
        (uint80 currentRoundId, int256 currentPrice, uint256 startTime, uint256 lastUpdate, uint80 roundAnswered) = feedSource.latestRoundData();

        // Ensure the price is valid (greater than 0)
        require(currentPrice > 0, "Price feed data is invalid");

        // Check if the data is fresh (less than 1 hour old)
        require(block.timestamp - lastUpdate < 1 hours, "Price data is stale");

        // Ensure data consistency between the current round and the answered round
        require(roundAnswered >= currentRoundId, "Inconsistent round data");

        return currentPrice;
    }
}
