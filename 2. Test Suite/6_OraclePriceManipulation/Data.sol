// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface AggregatorV3Interface  {
    function latestAnswer() external view returns (int256);
}

contract Data {
    AggregatorV3Interface private aggregator;

    constructor(address priceFeedAddress) {
        aggregator = AggregatorV3Interface(priceFeedAddress);
    }

    function getLatestPrice() public view returns (int256) {
        return aggregator.latestAnswer();
    }
}
