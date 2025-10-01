# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 2 |
| [M-2](#M-2) | `call()` should be used instead of `transfer()` on an `address payable` | 2 |
| [L-1](#L-1) | Empty `receive()/payable fallback()` function does not authenticate requests | 1 |
| [L-2](#L-2) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-3](#L-3) | Unsafe ERC20 operation(s) | 2 |
| [GAS-1](#GAS-1) | Using bools for storage incurs overhead | 1 |
| [GAS-2](#GAS-2) | For Operations that will not overflow, you could use unchecked | 4 |
| [GAS-3](#GAS-3) | Use Custom Errors instead of Revert Strings to save Gas | 5 |
| [GAS-4](#GAS-4) | State variables only set in the constructor should be declared `immutable` | 2 |
| [GAS-5](#GAS-5) | Use shift right/left instead of division/multiplication if possible | 4 |
| [GAS-6](#GAS-6) | Use != 0 instead of > 0 for unsigned integer comparison | 1 |
| [NC-1](#NC-1) | `constant`s should be defined rather than using magic numbers | 6 |
| [NC-2](#NC-2) | Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function | 4 |
| [NC-3](#NC-3) | Functions should not be longer than 50 lines | 3 |
| [NC-4](#NC-4) | Missing Event for critical parameters change | 1 |
| [NC-5](#NC-5) | NatSpec is completely non-existent on functions that should have them | 3 |



### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (2)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

54:     function retrieveEarnings() external payable onlyOwner {

59:     function resetNumber(uint256 number) external payable onlyOwner {

```

### <a name="M-2"></a>[M-2] `call()` should be used instead of `transfer()` on an `address payable`
The use of the deprecated `transfer()` function for an address may make the transaction fail due to the 2300 gas stipend

*Instances (2)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

50:             payable(msg.sender).transfer(msg.value * 2);

56:         payable(msg.sender).transfer(address(this).balance);

```

### <a name="L-1"></a>[L-1] Empty `receive()/payable fallback()` function does not authenticate requests
If the intention is for the Ether to be used, the function should call another function, otherwise it should revert (e.g. require(msg.sender == address(weth))). Having no access control on the function means that someone may send Ether to the contract, and have no way to get anything back out, which is a loss of funds. If the concern is having to spend a small amount of gas to check the sender against an immutable address, the code should at least have a function to rescue unused Ether.

*Instances (1)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

34:     receive() external payable {}

```

### <a name="L-2"></a>[L-2] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

2: pragma solidity 0.8.17;

```

### <a name="L-3"></a>[L-3] Unsafe ERC20 operation(s)

*Instances (2)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

50:             payable(msg.sender).transfer(msg.value * 2);

56:         payable(msg.sender).transfer(address(this).balance);

```

### <a name="GAS-1"></a>[GAS-1] Using bools for storage incurs overhead
Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (1)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

7:     bool public prizeClaimed;

```

### <a name="GAS-2"></a>[GAS-2] For Operations that will not overflow, you could use unchecked

*Instances (4)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

28:         require(msg.value > gameFee * 2, "Must fund the initial prize pool");

46:                 address(this).balance > fee * 2,

50:             payable(msg.sender).transfer(msg.value * 2);

61:             msg.value > fee * 2,

```

### <a name="GAS-3"></a>[GAS-3] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (5)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

28:         require(msg.value > gameFee * 2, "Must fund the initial prize pool");

37:         require(msg.value == fee, "You must");

38:         require(option > 0, "Option should be between 1 and 10");

39:         require(option <= 10, "Option should be between 1 and 10");

55:         require(prizeClaimed, "The prize has not yet been claimed");

```

### <a name="GAS-4"></a>[GAS-4] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (2)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

29:         _owner = msg.sender;

31:         fee = gameFee;

```

### <a name="GAS-5"></a>[GAS-5] Use shift right/left instead of division/multiplication if possible
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

*Instances (4)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

28:         require(msg.value > gameFee * 2, "Must fund the initial prize pool");

46:                 address(this).balance > fee * 2,

50:             payable(msg.sender).transfer(msg.value * 2);

61:             msg.value > fee * 2,

```

### <a name="GAS-6"></a>[GAS-6] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (1)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

38:         require(option > 0, "Option should be between 1 and 10");

```

### <a name="NC-1"></a>[NC-1] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (6)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

28:         require(msg.value > gameFee * 2, "Must fund the initial prize pool");

38:         require(option > 0, "Option should be between 1 and 10");

39:         require(option <= 10, "Option should be between 1 and 10");

46:                 address(this).balance > fee * 2,

50:             payable(msg.sender).transfer(msg.value * 2);

61:             msg.value > fee * 2,

```

### <a name="NC-2"></a>[NC-2] Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function

*Instances (4)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

12:         require(

20:         require(

38:         require(option > 0, "Option should be between 1 and 10");

39:         require(option <= 10, "Option should be between 1 and 10");

```

### <a name="NC-3"></a>[NC-3] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (3)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

36:     function guessTheNumber(uint256 option) external payable notOwner {

54:     function retrieveEarnings() external payable onlyOwner {

59:     function resetNumber(uint256 number) external payable onlyOwner {

```

### <a name="NC-4"></a>[NC-4] Missing Event for critical parameters change
Events help non-contract tools to track changes, and events prevent users from being surprised by changes.

*Instances (1)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

59:     function resetNumber(uint256 number) external payable onlyOwner {
            require(
                msg.value > fee * 2,
                "Resseting the number must also replenish the prize fund"
            );
            _secretNumber = number;
            prizeClaimed = false;

```

### <a name="NC-5"></a>[NC-5] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (3)*:
```solidity
File: DefaultAccessModifierVariableFixed.sol

36:     function guessTheNumber(uint256 option) external payable notOwner {

54:     function retrieveEarnings() external payable onlyOwner {

59:     function resetNumber(uint256 number) external payable onlyOwner {

```

