# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-2](#L-2) | Unspecific compiler version pragma | 1 |
| [GAS-1](#GAS-1) | For Operations that will not overflow, you could use unchecked | 1 |
| [GAS-2](#GAS-2) | State variables only set in the constructor should be declared `immutable` | 1 |
| [GAS-3](#GAS-3) | Use != 0 instead of > 0 for unsigned integer comparison | 1 |
| [NC-1](#NC-1) | Control structures do not follow the Solidity Style Guide | 1 |
| [NC-2](#NC-2) | Change uint to uint256 | 2 |
| [NC-3](#NC-3) | Internal and private variables and functions names should begin with an underscore | 1 |



### <a name="L-1"></a>[L-1] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

2: pragma solidity >=0.8.17;

```

### <a name="L-2"></a>[L-2] Unspecific compiler version pragma

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

2: pragma solidity >=0.8.17;

```

### <a name="GAS-1"></a>[GAS-1] For Operations that will not overflow, you could use unchecked

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

5:     uint private data; // explicit modifier

```

### <a name="GAS-2"></a>[GAS-2] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

8:         data = _data;

```

### <a name="GAS-3"></a>[GAS-3] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

2: pragma solidity >=0.8.17;

```

### <a name="NC-1"></a>[NC-1] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

5:     uint private data; // explicit modifier

```

### <a name="NC-2"></a>[NC-2] Change uint to uint256
Throughout the code base, some variables are declared as `uint`. To favor explicitness, consider changing all instances of `uint` to `uint256`

*Instances (2)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

5:     uint private data; // explicit modifier

7:     constructor (uint _data) {

```

### <a name="NC-3"></a>[NC-3] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (1)*:
```solidity
File: DefaultAccessModifierSimpleFixed.sol

5:     uint private data; // explicit modifier

```

