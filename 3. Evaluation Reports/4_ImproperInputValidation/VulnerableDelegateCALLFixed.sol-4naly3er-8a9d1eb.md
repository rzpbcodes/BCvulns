# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 2 |
| [L-1](#L-1) | Empty Function Body - Consider commenting why | 2 |
| [L-2](#L-2) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [GAS-1](#GAS-1) | Avoid contract existence checks by using low level calls | 1 |
| [GAS-2](#GAS-2) | State variables only set in the constructor should be declared `immutable` | 1 |
| [GAS-3](#GAS-3) | Functions guaranteed to revert when called by normal users can be marked `payable` | 2 |
| [NC-1](#NC-1) | Functions should not be longer than 50 lines | 3 |
| [NC-2](#NC-2) | NatSpec is completely non-existent on functions that should have them | 3 |
| [NC-3](#NC-3) | Consider using named mappings | 1 |
| [NC-4](#NC-4) | `require()` / `revert()` statements should have descriptive reason strings | 1 |
| [NC-5](#NC-5) | Avoid the use of sensitive terms | 1 |
| [NC-6](#NC-6) | Internal and private variables and functions names should begin with an underscore | 4 |
| [NC-7](#NC-7) | `public` functions not called by the contract should be declared `external` instead | 1 |



### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (2)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

22:     function addAcceptedWorker(address worker) external onlyOwner {

26:     function removeAcceptedWorker(address worker) external onlyOwner {

```

### <a name="L-1"></a>[L-1] Empty Function Body - Consider commenting why

*Instances (2)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

43:     function executePreCallLogic() private {

47:     function executePostCallLogic() private {

```

### <a name="L-2"></a>[L-2] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

2: pragma solidity 0.8.17;

```

### <a name="GAS-1"></a>[GAS-1] Avoid contract existence checks by using low level calls
Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

38:         (bool success, ) = workerAddress.delegatecall(callData);

```

### <a name="GAS-2"></a>[GAS-2] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

19:         owner = msg.sender;

```

### <a name="GAS-3"></a>[GAS-3] Functions guaranteed to revert when called by normal users can be marked `payable`
If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (2)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

22:     function addAcceptedWorker(address worker) external onlyOwner {

26:     function removeAcceptedWorker(address worker) external onlyOwner {

```

### <a name="NC-1"></a>[NC-1] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (3)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

22:     function addAcceptedWorker(address worker) external onlyOwner {

26:     function removeAcceptedWorker(address worker) external onlyOwner {

30:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

### <a name="NC-2"></a>[NC-2] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (3)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

22:     function addAcceptedWorker(address worker) external onlyOwner {

26:     function removeAcceptedWorker(address worker) external onlyOwner {

30:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

### <a name="NC-3"></a>[NC-3] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

6:     mapping(address => int256) private acceptedWorkers;

```

### <a name="NC-4"></a>[NC-4] `require()` / `revert()` statements should have descriptive reason strings

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

39:         require(success);

```

### <a name="NC-5"></a>[NC-5] Avoid the use of sensitive terms
Use [alternative variants](https://www.zdnet.com/article/mysql-drops-master-slave-and-blacklist-whitelist-terminology/), e.g. allowlist/denylist instead of whitelist/blacklist

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

35:             "The provided address is not featured on the workers whitelist"

```

### <a name="NC-6"></a>[NC-6] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (4)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

6:     mapping(address => int256) private acceptedWorkers;

8:     address private owner;

43:     function executePreCallLogic() private {

47:     function executePostCallLogic() private {

```

### <a name="NC-7"></a>[NC-7] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:
```solidity
File: VulnerableDelegateCALLFixed.sol

30:     function forwardToWorker(address workerAddress, bytes calldata callData)

```

