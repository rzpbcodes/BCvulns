# Report

| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | For Operations that will not overflow, you could use unchecked | 2 |
| [GAS-2](#GAS-2) | State variables only set in the constructor should be declared `immutable` | 1 |
| [GAS-3](#GAS-3) | Use shift right/left instead of division/multiplication if possible | 1 |
| [NC-1](#NC-1) | `constant`s should be defined rather than using magic numbers | 1 |
| [NC-2](#NC-2) | Functions should not be longer than 50 lines | 1 |
| [NC-3](#NC-3) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-4](#NC-4) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-5](#NC-5) | Constants should be defined rather than using magic numbers | 1 |
| [NC-6](#NC-6) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="GAS-1"></a>[GAS-1] For Operations that will not overflow, you could use unchecked

*Instances (2)*:
```solidity
File: UniswapV3Poolslot0.sol

9:         uint160 sqrtPriceX96, // Price √P in Q64.96 format

28:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2); // 🚨 Vulnerable to flash loans

```

### <a name="GAS-2"></a>[GAS-2] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

23:         uniswapPool = IUniswapV3Pool(_pool);

```

### <a name="GAS-3"></a>[GAS-3] Use shift right/left instead of division/multiplication if possible
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
File: UniswapV3Poolslot0.sol

28:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2); // 🚨 Vulnerable to flash loans

```

### <a name="NC-1"></a>[NC-1] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

28:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2); // 🚨 Vulnerable to flash loans

```

### <a name="NC-2"></a>[NC-2] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

26:     function getUniswapPrice() public view returns (uint256 price) {

```

### <a name="NC-3"></a>[NC-3] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

7: interface IUniswapV3Pool {

```

### <a name="NC-4"></a>[NC-4] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

1: 
   Current order:
   FunctionDefinition.slot0
   VariableDeclaration.uniswapPool
   FunctionDefinition.constructor
   FunctionDefinition.getUniswapPrice
   
   Suggested order:
   VariableDeclaration.uniswapPool
   FunctionDefinition.slot0
   FunctionDefinition.constructor
   FunctionDefinition.getUniswapPrice

```

### <a name="NC-5"></a>[NC-5] Constants should be defined rather than using magic numbers

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

28:         price = uint256(sqrtPriceX96) * uint256(sqrtPriceX96) * 1e18 >> (96 * 2); // 🚨 Vulnerable to flash loans

```

### <a name="NC-6"></a>[NC-6] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: UniswapV3Poolslot0.sol

26:     function getUniswapPrice() public view returns (uint256 price) {

```

