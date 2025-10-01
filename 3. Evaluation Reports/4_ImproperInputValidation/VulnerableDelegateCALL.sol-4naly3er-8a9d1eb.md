# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Empty Function Body - Consider commenting why | 2 |
| [L-2](#L-2) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [GAS-1](#GAS-1) | Avoid contract existence checks by using low level calls | 1 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 1 |
| [NC-2](#NC-2) | NatSpec is completely non-existent on functions that should have them | 1 |
| [NC-3](#NC-3) | `require()` / `revert()` statements should have descriptive reason strings | 1 |
| [NC-4](#NC-4) | Internal and private variables and functions names should begin with an underscore | 3 |
| [NC-5](#NC-5) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="L-1"></a>[L-1] Empty Function Body - Consider commenting why

*Instances (2)*:
```solidity
File: VulnerableDelegateCALL.sol

19:     function executePreCallLogic() private {

23:     function executePostCallLogic() private {

```

### <a name="L-2"></a>[L-2] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

2: pragma solidity 0.8.17;

```

### <a name="GAS-1"></a>[GAS-1] Avoid contract existence checks by using low level calls
Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

14:         (bool success, ) = workerAddress.delegatecall(callData);

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

10:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

### <a name="NC-2"></a>[NC-2] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

10:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

### <a name="NC-3"></a>[NC-3] `require()` / `revert()` statements should have descriptive reason strings

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

15:         require(success);

```

### <a name="NC-4"></a>[NC-4] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (3)*:
```solidity
File: VulnerableDelegateCALL.sol

8:     uint256 private vulnerableStorage;

19:     function executePreCallLogic() private {

23:     function executePostCallLogic() private {

```

### <a name="NC-5"></a>[NC-5] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: VulnerableDelegateCALL.sol

10:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

