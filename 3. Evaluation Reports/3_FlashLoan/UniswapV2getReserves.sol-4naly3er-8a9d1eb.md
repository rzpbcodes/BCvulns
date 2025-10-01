# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Division by zero not prevented | 1 |
| [L-2](#L-2) | Possible rounding issue | 1 |
| [L-3](#L-3) | Loss of precision | 1 |
| [GAS-1](#GAS-1) | For Operations that will not overflow, you could use unchecked | 1 |
| [GAS-2](#GAS-2) | State variables only set in the constructor should be declared `immutable` | 3 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 4 |
| [NC-2](#NC-2) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-3](#NC-3) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-4](#NC-4) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="L-1"></a>[L-1] Division by zero not prevented
The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

27:         return (uint256(reserve1) * 1e18) / uint256(reserve0); 

```

### <a name="L-2"></a>[L-2] Possible rounding issue
Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator. Also, there is indication of multiplication and division without the use of parenthesis which could result in issues.

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

27:         return (uint256(reserve1) * 1e18) / uint256(reserve0); 

```

### <a name="L-3"></a>[L-3] Loss of precision
Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

27:         return (uint256(reserve1) * 1e18) / uint256(reserve0); 

```

### <a name="GAS-1"></a>[GAS-1] For Operations that will not overflow, you could use unchecked

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

27:         return (uint256(reserve1) * 1e18) / uint256(reserve0); 

```

### <a name="GAS-2"></a>[GAS-2] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (3)*:
```solidity
File: UniswapV2getReserves.sol

19:         uniswapPair = IUniswapV2Pair(_pair);

20:         tokenA = uniswapPair.token0();

21:         tokenB = uniswapPair.token1();

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (4)*:
```solidity
File: UniswapV2getReserves.sol

8:     function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32);

9:     function token0() external view returns (address);

10:     function token1() external view returns (address);

24:     function getUniswapPrice() public view returns (uint256) {

```

### <a name="NC-2"></a>[NC-2] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

7: interface IUniswapV2Pair {

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
File: UniswapV2getReserves.sol

1: 
   Current order:
   FunctionDefinition.getReserves
   FunctionDefinition.token0
   FunctionDefinition.token1
   VariableDeclaration.uniswapPair
   VariableDeclaration.tokenA
   VariableDeclaration.tokenB
   FunctionDefinition.constructor
   FunctionDefinition.getUniswapPrice
   
   Suggested order:
   VariableDeclaration.uniswapPair
   VariableDeclaration.tokenA
   VariableDeclaration.tokenB
   FunctionDefinition.getReserves
   FunctionDefinition.token0
   FunctionDefinition.token1
   FunctionDefinition.constructor
   FunctionDefinition.getUniswapPrice

```

### <a name="NC-4"></a>[NC-4] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: UniswapV2getReserves.sol

24:     function getUniswapPrice() public view returns (uint256) {

```

