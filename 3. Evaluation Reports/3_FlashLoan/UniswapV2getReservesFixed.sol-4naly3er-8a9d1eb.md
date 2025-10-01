# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Division by zero not prevented | 2 |
| [GAS-1](#GAS-1) | For Operations that will not overflow, you could use unchecked | 6 |
| [GAS-2](#GAS-2) | Use Custom Errors instead of Revert Strings to save Gas | 2 |
| [GAS-3](#GAS-3) | State variables only set in the constructor should be declared `immutable` | 3 |
| [GAS-4](#GAS-4) | Use != 0 instead of > 0 for unsigned integer comparison | 2 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 6 |
| [NC-2](#NC-2) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-3](#NC-3) | Missing Event for critical parameters change | 1 |
| [NC-4](#NC-4) | NatSpec is completely non-existent on functions that should have them | 1 |
| [NC-5](#NC-5) | Adding a `return` statement when the function defines a named return variable, is redundant | 2 |
| [NC-6](#NC-6) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-7](#NC-7) | `public` functions not called by the contract should be declared `external` instead | 2 |



### <a name="L-1"></a>[L-1] Division by zero not prevented
The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (2)*:
```solidity
File: UniswapV2getReservesFixed.sol

56:         uint256 price0TWAP = (currentPrice0Cumulative - lastPrice0Cumulative) / timeElapsed;

57:         uint256 price1TWAP = (currentPrice1Cumulative - lastPrice1Cumulative) / timeElapsed;

```

### <a name="GAS-1"></a>[GAS-1] For Operations that will not overflow, you could use unchecked

*Instances (6)*:
```solidity
File: UniswapV2getReservesFixed.sol

40:         uint32 timeElapsed = currentTimestamp - lastTimestamp;

53:         uint32 timeElapsed = currentTimestamp - lastTimestamp;

56:         uint256 price0TWAP = (currentPrice0Cumulative - lastPrice0Cumulative) / timeElapsed;

57:         uint256 price1TWAP = (currentPrice1Cumulative - lastPrice1Cumulative) / timeElapsed;

61:             return price0TWAP; // Price of tokenA in terms of tokenB

63:             return price1TWAP; // Price of tokenB in terms of tokenA

```

### <a name="GAS-2"></a>[GAS-2] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (2)*:
```solidity
File: UniswapV2getReservesFixed.sol

41:         require(timeElapsed > 0, "Not enough time has passed");

54:         require(timeElapsed > 0, "No time elapsed");

```

### <a name="GAS-3"></a>[GAS-3] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (3)*:
```solidity
File: UniswapV2getReservesFixed.sol

25:         uniswapPair = IUniswapV2Pair(_pair);

26:         tokenA = uniswapPair.token0();

27:         tokenB = uniswapPair.token1();

```

### <a name="GAS-4"></a>[GAS-4] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (2)*:
```solidity
File: UniswapV2getReservesFixed.sol

41:         require(timeElapsed > 0, "Not enough time has passed");

54:         require(timeElapsed > 0, "No time elapsed");

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (6)*:
```solidity
File: UniswapV2getReservesFixed.sol

8:     function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);

9:     function token0() external view returns (address);

10:     function token1() external view returns (address);

11:     function price0CumulativeLast() external view returns (uint256);

12:     function price1CumulativeLast() external view returns (uint256);

48:     function getTWAPPrice() public view returns (uint256 price) {

```

### <a name="NC-2"></a>[NC-2] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: UniswapV2getReservesFixed.sol

7: interface IUniswapV2Pair {

```

### <a name="NC-3"></a>[NC-3] Missing Event for critical parameters change
Events help non-contract tools to track changes, and events prevent users from being surprised by changes.

*Instances (1)*:
```solidity
File: UniswapV2getReservesFixed.sol

35:     function updateTWAP() public {
            uint256 currentPrice0Cumulative = uniswapPair.price0CumulativeLast();
            uint256 currentPrice1Cumulative = uniswapPair.price1CumulativeLast();
            (, , uint32 currentTimestamp) = uniswapPair.getReserves();
    
            uint32 timeElapsed = currentTimestamp - lastTimestamp;
            require(timeElapsed > 0, "Not enough time has passed");
    
            lastPrice0Cumulative = currentPrice0Cumulative;
            lastPrice1Cumulative = currentPrice1Cumulative;
            lastTimestamp = currentTimestamp;

```

### <a name="NC-4"></a>[NC-4] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (1)*:
```solidity
File: UniswapV2getReservesFixed.sol

35:     function updateTWAP() public {

```

### <a name="NC-5"></a>[NC-5] Adding a `return` statement when the function defines a named return variable, is redundant

*Instances (2)*:
```solidity
File: UniswapV2getReservesFixed.sol

48:     function getTWAPPrice() public view returns (uint256 price) {
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

48:     function getTWAPPrice() public view returns (uint256 price) {
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

```

### <a name="NC-6"></a>[NC-6] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: UniswapV2getReservesFixed.sol

1: 
   Current order:
   FunctionDefinition.getReserves
   FunctionDefinition.token0
   FunctionDefinition.token1
   FunctionDefinition.price0CumulativeLast
   FunctionDefinition.price1CumulativeLast
   VariableDeclaration.uniswapPair
   VariableDeclaration.tokenA
   VariableDeclaration.tokenB
   VariableDeclaration.lastPrice0Cumulative
   VariableDeclaration.lastPrice1Cumulative
   VariableDeclaration.lastTimestamp
   FunctionDefinition.constructor
   FunctionDefinition.updateTWAP
   FunctionDefinition.getTWAPPrice
   
   Suggested order:
   VariableDeclaration.uniswapPair
   VariableDeclaration.tokenA
   VariableDeclaration.tokenB
   VariableDeclaration.lastPrice0Cumulative
   VariableDeclaration.lastPrice1Cumulative
   VariableDeclaration.lastTimestamp
   FunctionDefinition.getReserves
   FunctionDefinition.token0
   FunctionDefinition.token1
   FunctionDefinition.price0CumulativeLast
   FunctionDefinition.price1CumulativeLast
   FunctionDefinition.constructor
   FunctionDefinition.updateTWAP
   FunctionDefinition.getTWAPPrice

```

### <a name="NC-7"></a>[NC-7] `public` functions not called by the contract should be declared `external` instead

*Instances (2)*:
```solidity
File: UniswapV2getReservesFixed.sol

35:     function updateTWAP() public {

48:     function getTWAPPrice() public view returns (uint256 price) {

```

