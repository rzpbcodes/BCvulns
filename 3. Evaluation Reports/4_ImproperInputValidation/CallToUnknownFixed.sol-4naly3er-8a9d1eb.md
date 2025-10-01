# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Missing checks for `address(0)` when assigning values to address state variables | 1 |
| [L-2](#L-2) | External call recipient may consume all transaction gas | 2 |
| [L-3](#L-3) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-4](#L-4) | Unsafe solidity low-level call can cause gas grief attack | 2 |
| [GAS-1](#GAS-1) | Use assembly to check for `address(0)` | 2 |
| [GAS-2](#GAS-2) | Use calldata instead of memory for function arguments that do not get mutated | 2 |
| [GAS-3](#GAS-3) | Use Custom Errors instead of Revert Strings to save Gas | 2 |
| [GAS-4](#GAS-4) | State variables only set in the constructor should be declared `immutable` | 1 |
| [NC-1](#NC-1) | Replace `abi.encodeWithSignature` and `abi.encodeWithSelector` with `abi.encodeCall` which keeps the code typo/type safe | 2 |
| [NC-2](#NC-2) | Missing checks for `address(0)` when assigning values to address state variables | 1 |
| [NC-3](#NC-3) | Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function | 2 |
| [NC-4](#NC-4) | NatSpec is completely non-existent on functions that should have them | 2 |
| [NC-5](#NC-5) | Consider using named mappings | 1 |
| [NC-6](#NC-6) | `require()` / `revert()` statements should have descriptive reason strings | 2 |
| [NC-7](#NC-7) | Internal and private variables and functions names should begin with an underscore | 1 |



### <a name="L-1"></a>[L-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

11:         encryptionProvider = _encryptionProvider;

```

### <a name="L-2"></a>[L-2] External call recipient may consume all transaction gas
There is no limit specified on the amount of gas used, so the recipient can use up all of the transaction's gas, causing it to revert. Use `addr.call{gas: <amount>}("")` or [this](https://github.com/nomad-xyz/ExcessivelySafeCall) library instead.

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

19:         (bool success, bytes memory encryptedText) = encryptionProvider.call(

32:         (bool success, bytes memory decryptedText) = encryptionProvider.call(

```

### <a name="L-3"></a>[L-3] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

2: pragma solidity 0.8.17;

```

### <a name="L-4"></a>[L-4] Unsafe solidity low-level call can cause gas grief attack
Using the low-level calls of a solidity address can leave the contract open to gas grief attacks. These attacks occur when the called contract returns a large amount of data.

So when calling an external contract, it is necessary to check the length of the return data before reading/copying it (using `returndatasize()`).

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

19:         (bool success, bytes memory encryptedText) = encryptionProvider.call(

32:         (bool success, bytes memory decryptedText) = encryptionProvider.call(

```

### <a name="GAS-1"></a>[GAS-1] Use assembly to check for `address(0)`
*Saves 6 gas per instance*

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

18:         require(encryptionProvider != address(0));

31:         require(encryptionProvider != address(0));

```

### <a name="GAS-2"></a>[GAS-2] Use calldata instead of memory for function arguments that do not get mutated
When a function with a `memory` array is called externally, the `abi.decode()` step has to use a for-loop to copy each index of the `calldata` to the `memory` index. Each iteration of this for-loop costs at least 60 gas (i.e. `60 * <mem_array>.length`). Using `calldata` directly bypasses this loop. 

If the array is passed to an `internal` function which passes the array to another internal function where the array is modified and therefore `memory` is used in the `external` call, it's still more gas-efficient to use `calldata` when the `external` function uses modifiers, since the modifiers may prevent the internal functions from being called. Structs have the same overhead as an array of length one. 

 *Saves 60 gas per instance*

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

14:     function encryptMessage(string memory message)

27:     function decryptMessage(string memory message)

```

### <a name="GAS-3"></a>[GAS-3] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

22:         require(success, "Call to external contract failed");

35:         require(success, "Call to external contract failed");

```

### <a name="GAS-4"></a>[GAS-4] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

11:         encryptionProvider = _encryptionProvider;

```

### <a name="NC-1"></a>[NC-1] Replace `abi.encodeWithSignature` and `abi.encodeWithSelector` with `abi.encodeCall` which keeps the code typo/type safe
When using `abi.encodeWithSignature`, it is possible to include a typo for the correct function signature.
When using `abi.encodeWithSignature` or `abi.encodeWithSelector`, it is also possible to provide parameters that are not of the correct type for the function.

To avoid these pitfalls, it would be best to use [`abi.encodeCall`](https://solidity-by-example.org/abi-encode/) instead.

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

20:             abi.encodeWithSignature("encrypt(string)", message)

33:             abi.encodeWithSignature("decrypt(string)", message)

```

### <a name="NC-2"></a>[NC-2] Missing checks for `address(0)` when assigning values to address state variables

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

11:         encryptionProvider = _encryptionProvider;

```

### <a name="NC-3"></a>[NC-3] Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

22:         require(success, "Call to external contract failed");

35:         require(success, "Call to external contract failed");

```

### <a name="NC-4"></a>[NC-4] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

14:     function encryptMessage(string memory message)

27:     function decryptMessage(string memory message)

```

### <a name="NC-5"></a>[NC-5] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

7:     mapping(address => bytes) public messages;

```

### <a name="NC-6"></a>[NC-6] `require()` / `revert()` statements should have descriptive reason strings

*Instances (2)*:
```solidity
File: CallToUnknownFixed.sol

18:         require(encryptionProvider != address(0));

31:         require(encryptionProvider != address(0));

```

### <a name="NC-7"></a>[NC-7] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (1)*:
```solidity
File: CallToUnknownFixed.sol

8:     address private encryptionProvider;

```

