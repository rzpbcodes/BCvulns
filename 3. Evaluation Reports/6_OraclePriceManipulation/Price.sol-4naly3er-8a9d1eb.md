# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Chainlink's `latestRoundData` might return stale or incorrect results | 1 |
| [M-2](#M-2) | Missing checks for whether the L2 Sequencer is active | 1 |
| [GAS-1](#GAS-1) | State variables only set in the constructor should be declared `immutable` | 1 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 2 |
| [NC-2](#NC-2) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-3](#NC-3) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-4](#NC-4) | Internal and private variables and functions names should begin with an underscore | 1 |
| [NC-5](#NC-5) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="M-1"></a>[M-1] Chainlink's `latestRoundData` might return stale or incorrect results
- This is a common issue: https://github.com/code-423n4/2022-12-tigris-findings/issues/655, https://code4rena.com/reports/2022-10-inverse#m-17-chainlink-oracle-data-feed-is-not-sufficiently-validated-and-can-return-stale-price, https://app.sherlock.xyz/audits/contests/41#issue-m-12-chainlinks-latestrounddata--return-stale-or-incorrect-result and many more occurrences.

`latestRoundData()` is used to fetch the asset price from a Chainlink aggregator, but it's missing additional validations to ensure that the round is complete. If there is a problem with Chainlink starting a new round and finding consensus on the new value for the oracle (e.g. Chainlink nodes abandon the oracle, chain congestion, vulnerability/attacks on the Chainlink system) consumers of this contract may continue using outdated stale data / stale prices.

More bugs related to chainlink here: [Chainlink Oracle Security Considerations](https://medium.com/cyfrin/chainlink-oracle-defi-attacks-93b6cb6541bf#99af)

*Instances (1)*:
```solidity
File: Price.sol

17:         (, int256 currentPrice, , , ) = priceSource.latestRoundData();
            return currentPrice;
        }
    }
    

```

### <a name="M-2"></a>[M-2] Missing checks for whether the L2 Sequencer is active
Chainlink recommends that users using price oracles, check whether the Arbitrum Sequencer is [active](https://docs.chain.link/data-feeds/l2-sequencer-feeds#arbitrum). If the sequencer goes down, the Chainlink oracles will have stale prices from before the downtime, until a new L2 OCR transaction goes through. Users who submit their transactions via the [L1 Dealyed Inbox](https://developer.arbitrum.io/tx-lifecycle#1b--or-from-l1-via-the-delayed-inbox) will be able to take advantage of these stale prices. Use a [Chainlink oracle](https://blog.chain.link/how-to-use-chainlink-price-feeds-on-arbitrum/#almost_done!_meet_the_l2_sequencer_health_flag) to determine whether the sequencer is offline or not, and don't allow operations to take place while the sequencer is offline.

*Instances (1)*:
```solidity
File: Price.sol

17:         (, int256 currentPrice, , , ) = priceSource.latestRoundData();
            return currentPrice;
        }
    }
    

```

### <a name="GAS-1"></a>[GAS-1] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: Price.sol

12:         priceSource = AggregatorV3Interface(feedAddress);

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (2)*:
```solidity
File: Price.sol

5:     function latestRoundData() external view returns (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound);

15:     function fetchCurrentPrice() public view returns (int256) {

```

### <a name="NC-2"></a>[NC-2] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: Price.sol

4: interface AggregatorV3Interface {

```

### <a name="NC-3"></a>[NC-3] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: Price.sol

1: 
   Current order:
   FunctionDefinition.latestRoundData
   VariableDeclaration.priceSource
   FunctionDefinition.constructor
   FunctionDefinition.fetchCurrentPrice
   
   Suggested order:
   VariableDeclaration.priceSource
   FunctionDefinition.latestRoundData
   FunctionDefinition.constructor
   FunctionDefinition.fetchCurrentPrice

```

### <a name="NC-4"></a>[NC-4] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (1)*:
```solidity
File: Price.sol

9:     AggregatorV3Interface private priceSource;

```

### <a name="NC-5"></a>[NC-5] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: Price.sol

15:     function fetchCurrentPrice() public view returns (int256) {

```

