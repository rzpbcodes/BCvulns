// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound);
}

contract DataFixed {
    AggregatorV3Interface private priceFeed;

    constructor(address feedAddress) {
        priceFeed = AggregatorV3Interface(feedAddress);
    }

    function fetchLatestPrice() public view returns (int256) {
        // Fetching the latest round data
        (uint80 roundId, int256 price, uint256 startTime, uint256 lastUpdated, uint80 roundAnswered) = priceFeed.latestRoundData();

        // Price validation: Ensure the price is valid
        require(price > 0, "Price is invalid");

        // Stale data check: Ensure the price is fresh
        require(block.timestamp - lastUpdated < 1 hours, "Price data is stale");

        // Round data consistency check
        require(roundAnswered >= roundId, "Round data inconsistency");

        return price;
    }
}