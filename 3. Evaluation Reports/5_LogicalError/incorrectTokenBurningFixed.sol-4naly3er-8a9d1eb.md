# Report

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-2](#L-2) | File allows a version of solidity that is susceptible to an assembly optimizer bug | 1 |
| [GAS-1](#GAS-1) | `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings) | 2 |
| [GAS-2](#GAS-2) | Use assembly to check for `address(0)` | 2 |
| [GAS-3](#GAS-3) | For Operations that will not overflow, you could use unchecked | 5 |
| [GAS-4](#GAS-4) | Use Custom Errors instead of Revert Strings to save Gas | 3 |
| [NC-1](#NC-1) | `constant`s should be defined rather than using magic numbers | 1 |
| [NC-2](#NC-2) | Functions should not be longer than 50 lines | 3 |
| [NC-3](#NC-3) | Change int to int256 | 1 |
| [NC-4](#NC-4) | NatSpec is completely non-existent on functions that should have them | 2 |
| [NC-5](#NC-5) | File's first line is not an SPDX Identifier | 1 |
| [NC-6](#NC-6) | Consider using named mappings | 1 |
| [NC-7](#NC-7) | Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables | 1 |
| [NC-8](#NC-8) | Use scientific notation for readability reasons for large multiples of ten | 1 |
| [NC-9](#NC-9) | Use Underscores for Number Literals (add an underscore every 3 digits) | 1 |
| [NC-10](#NC-10) | Event is missing `indexed` fields | 1 |
| [NC-11](#NC-11) | `public` functions not called by the contract should be declared `external` instead | 3 |



### <a name="L-1"></a>[L-1] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="L-2"></a>[L-2] File allows a version of solidity that is susceptible to an assembly optimizer bug
In solidity versions 0.8.13 and 0.8.14, there is an [optimizer bug](https://github.com/ethereum/solidity-blog/blob/499ab8abc19391be7b7b34f88953a067029a5b45/_posts/2022-06-15-inline-assembly-memory-side-effects-bug.md) where, if the use of a variable is in a separate `assembly` block from the block in which it was stored, the `mstore` operation is optimized out, leading to uninitialized memory. The code currently does not have such a pattern of execution, but it does use `mstore`s in `assembly` blocks, so it is a risk for future changes. The affected solidity versions should be avoided if at all possible.

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="GAS-1"></a>[GAS-1] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)
This saves **16 gas per instance.**

*Instances (2)*:
```solidity
File: incorrectTokenBurningFixed.sol

17:         balances[account] += amount;

18:         totalSupply += amount;

```

### <a name="GAS-2"></a>[GAS-2] Use assembly to check for `address(0)`
*Saves 6 gas per instance*

*Instances (2)*:
```solidity
File: incorrectTokenBurningFixed.sol

16:         require(account != address(0), "Cannot mint to the zero address");

23:         require(account != address(0), "Cannot burn from the zero address");

```

### <a name="GAS-3"></a>[GAS-3] For Operations that will not overflow, you could use unchecked

*Instances (5)*:
```solidity
File: incorrectTokenBurningFixed.sol

11:         totalSupply = 1000000; // Initial supply of tokens

17:         balances[account] += amount;

18:         totalSupply += amount;

27:         balances[account] -= amount;

30:         totalSupply -= amount;

```

### <a name="GAS-4"></a>[GAS-4] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (3)*:
```solidity
File: incorrectTokenBurningFixed.sol

16:         require(account != address(0), "Cannot mint to the zero address");

23:         require(account != address(0), "Cannot burn from the zero address");

24:         require(balances[account] >= amount, "Insufficient balance to burn");

```

### <a name="NC-1"></a>[NC-1] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

11:         totalSupply = 1000000; // Initial supply of tokens

```

### <a name="NC-2"></a>[NC-2] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (3)*:
```solidity
File: incorrectTokenBurningFixed.sol

15:     function mint(address account, uint256 amount) public {

22:     function burn(address account, uint256 amount) public {

37:     function balanceOf(address account) public view returns (uint256) {

```

### <a name="NC-3"></a>[NC-3] Change int to int256
Throughout the code base, some variables are declared as `int`. To favor explicitness, consider changing all instances of `int` to `int256`

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

16:         require(account != address(0), "Cannot mint to the zero address");

```

### <a name="NC-4"></a>[NC-4] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (2)*:
```solidity
File: incorrectTokenBurningFixed.sol

15:     function mint(address account, uint256 amount) public {

22:     function burn(address account, uint256 amount) public {

```

### <a name="NC-5"></a>[NC-5] File's first line is not an SPDX Identifier

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="NC-6"></a>[NC-6] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

4:     mapping(address => uint256) public balances;

```

### <a name="NC-7"></a>[NC-7] Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables
If the variable needs to be different based on which class it comes from, a `view`/`pure` *function* should be used instead (e.g. like [this](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/76eee35971c2541585e05cbf258510dda7b2fbc6/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L59)).

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="NC-8"></a>[NC-8] Use scientific notation for readability reasons for large multiples of ten
The more a number has zeros, the harder it becomes to see with the eyes if it's the intended value. To ease auditing and bug bounty hunting, consider using the scientific notation

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

11:         totalSupply = 1000000; // Initial supply of tokens

```

### <a name="NC-9"></a>[NC-9] Use Underscores for Number Literals (add an underscore every 3 digits)

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

11:         totalSupply = 1000000; // Initial supply of tokens

```

### <a name="NC-10"></a>[NC-10] Event is missing `indexed` fields
Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (1)*:
```solidity
File: incorrectTokenBurningFixed.sol

8:     event Burn(address indexed account, uint256 amount);

```

### <a name="NC-11"></a>[NC-11] `public` functions not called by the contract should be declared `external` instead

*Instances (3)*:
```solidity
File: incorrectTokenBurningFixed.sol

15:     function mint(address account, uint256 amount) public {

22:     function burn(address account, uint256 amount) public {

37:     function balanceOf(address account) public view returns (uint256) {

```

