# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Division by zero not prevented | 1 |
| [L-2](#L-2) | Loss of precision | 1 |
| [GAS-1](#GAS-1) | For Operations that will not overflow, you could use unchecked | 6 |
| [GAS-2](#GAS-2) | State variables only set in the constructor should be declared `immutable` | 2 |
| [GAS-3](#GAS-3) | Using `private` rather than `public` for constants, saves gas | 1 |
| [GAS-4](#GAS-4) | Use shift right/left instead of division/multiplication if possible | 1 |
| [NC-1](#NC-1) | Array indices should be referenced via `enum`s rather than via numeric literals | 3 |
| [NC-2](#NC-2) | `constant`s should be defined rather than using magic numbers | 1 |
| [NC-3](#NC-3) | Control structures do not follow the Solidity Style Guide | 2 |
| [NC-4](#NC-4) | Functions should not be longer than 50 lines | 4 |
| [NC-5](#NC-5) | Interfaces should be defined in separate files from their usage | 2 |
| [NC-6](#NC-6) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-7](#NC-7) | Use Underscores for Number Literals (add an underscore every 3 digits) | 1 |
| [NC-8](#NC-8) | Constants should be defined rather than using magic numbers | 1 |



### <a name="L-1"></a>[L-1] Division by zero not prevented
The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

34:         int56 averageTick = tickDifference / int56(uint56(TWAP_INTERVAL));

```

### <a name="L-2"></a>[L-2] Loss of precision
Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

34:         int56 averageTick = tickDifference / int56(uint56(TWAP_INTERVAL));

```

### <a name="GAS-1"></a>[GAS-1] For Operations that will not overflow, you could use unchecked

*Instances (6)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

19:     uint32 public constant TWAP_INTERVAL = 3600; // 1-hour TWAP

28:         timePoints[0] = TWAP_INTERVAL; // 1 hour ago

29:         timePoints[1] = 0; // Now

33:         int56 tickDifference = tickCumulatives[1] - tickCumulatives[0];

34:         int56 averageTick = tickDifference / int56(uint56(TWAP_INTERVAL));

37:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2);

```

### <a name="GAS-2"></a>[GAS-2] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (2)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

22:         uniswapPool = IUniswapV3Pool(_pool);

23:         tickMath = ITickMath(_tickMath);

```

### <a name="GAS-3"></a>[GAS-3] Using `private` rather than `public` for constants, saves gas
If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

19:     uint32 public constant TWAP_INTERVAL = 3600; // 1-hour TWAP

```

### <a name="GAS-4"></a>[GAS-4] Use shift right/left instead of division/multiplication if possible
While the `DIV` / `MUL` opcode uses 5 gas, the `SHR` / `SHL` opcode only uses 3 gas. Furthermore, beware that Solidity's division operation also includes a division-by-0 prevention which is bypassed using shifting. Eventually, overflow checks are never performed for shift operations as they are done for arithmetic operations. Instead, the result is always truncated, so the calculation can be unchecked in Solidity version `0.8+`
- Use `>> 1` instead of `/ 2`
- Use `>> 2` instead of `/ 4`
- Use `<< 3` instead of `* 8`
- ...
- Use `>> 5` instead of `/ 2^5 == / 32`
- Use `<< 6` instead of `* 2^6 == * 64`

TL;DR:
- Shifting left by N is like multiplying by 2^N (Each bits to the left is an increased power of 2)
- Shifting right by N is like dividing by 2^N (Each bits to the right is a decreased power of 2)

*Saves around 2 gas + 20 for unchecked per instance*

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

37:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2);

```

### <a name="NC-1"></a>[NC-1] Array indices should be referenced via `enum`s rather than via numeric literals

*Instances (3)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

28:         timePoints[0] = TWAP_INTERVAL; // 1 hour ago

29:         timePoints[1] = 0; // Now

33:         int56 tickDifference = tickCumulatives[1] - tickCumulatives[0];

```

### <a name="NC-2"></a>[NC-2] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

37:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2);

```

### <a name="NC-3"></a>[NC-3] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (2)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

33:         int56 tickDifference = tickCumulatives[1] - tickCumulatives[0];

34:         int56 averageTick = tickDifference / int56(uint56(TWAP_INTERVAL));

```

### <a name="NC-4"></a>[NC-4] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (4)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

5:     function observe(uint32[] calldata secondsAgos) external view returns (

12:     function getSqrtRatioAtTick(int24 tick) external pure returns (uint160);

13:     function getTickAtSqrtRatio(uint160 sqrtPriceX96) external pure returns (int24);

26:     function getTWAPPrice() external view returns (uint256 price) {

```

### <a name="NC-5"></a>[NC-5] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (2)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

4: interface IUniswapV3Pool {

11: interface ITickMath {

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
File: UniswapV3Poolslot0Fixed.sol

1: 
   Current order:
   FunctionDefinition.observe
   FunctionDefinition.getSqrtRatioAtTick
   FunctionDefinition.getTickAtSqrtRatio
   VariableDeclaration.uniswapPool
   VariableDeclaration.tickMath
   VariableDeclaration.TWAP_INTERVAL
   FunctionDefinition.constructor
   FunctionDefinition.getTWAPPrice
   
   Suggested order:
   VariableDeclaration.uniswapPool
   VariableDeclaration.tickMath
   VariableDeclaration.TWAP_INTERVAL
   FunctionDefinition.observe
   FunctionDefinition.getSqrtRatioAtTick
   FunctionDefinition.getTickAtSqrtRatio
   FunctionDefinition.constructor
   FunctionDefinition.getTWAPPrice

```

### <a name="NC-7"></a>[NC-7] Use Underscores for Number Literals (add an underscore every 3 digits)

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

19:     uint32 public constant TWAP_INTERVAL = 3600; // 1-hour TWAP

```

### <a name="NC-8"></a>[NC-8] Constants should be defined rather than using magic numbers

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0Fixed.sol

37:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2);

```

