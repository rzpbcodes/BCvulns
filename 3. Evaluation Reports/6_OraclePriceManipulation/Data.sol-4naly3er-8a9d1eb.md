# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Use of deprecated chainlink function: `latestAnswer()` | 1 |
| [GAS-1](#GAS-1) | State variables only set in the constructor should be declared `immutable` | 1 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 2 |
| [NC-2](#NC-2) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-3](#NC-3) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-4](#NC-4) | Internal and private variables and functions names should begin with an underscore | 1 |
| [NC-5](#NC-5) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="M-1"></a>[M-1] Use of deprecated chainlink function: `latestAnswer()`
According to Chainlink’s documentation [(API Reference)](https://docs.chain.link/data-feeds/api-reference#latestanswer), the latestAnswer function is deprecated. This function does not throw an error if no answer has been reached, but instead returns 0, possibly causing an incorrect price to be fed to the different price feeds or even a Denial of Service.

*Instances (1)*:
```solidity
File: Data.sol

16:         return aggregator.latestAnswer();

```

### <a name="GAS-1"></a>[GAS-1] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: Data.sol

12:         aggregator = AggregatorV3Interface(priceFeedAddress);

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (2)*:
```solidity
File: Data.sol

5:     function latestAnswer() external view returns (int256);

15:     function getLatestPrice() public view returns (int256) {

```

### <a name="NC-2"></a>[NC-2] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: Data.sol

4: interface AggregatorV3Interface  {

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
File: Data.sol

1: 
   Current order:
   FunctionDefinition.latestAnswer
   VariableDeclaration.aggregator
   FunctionDefinition.constructor
   FunctionDefinition.getLatestPrice
   
   Suggested order:
   VariableDeclaration.aggregator
   FunctionDefinition.latestAnswer
   FunctionDefinition.constructor
   FunctionDefinition.getLatestPrice

```

### <a name="NC-4"></a>[NC-4] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (1)*:
```solidity
File: Data.sol

9:     AggregatorV3Interface private aggregator;

```

### <a name="NC-5"></a>[NC-5] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: Data.sol

15:     function getLatestPrice() public view returns (int256) {

```

