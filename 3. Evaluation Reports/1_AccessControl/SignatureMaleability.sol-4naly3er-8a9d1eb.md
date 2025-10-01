# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | `call()` should be used instead of `transfer()` on an `address payable` | 1 |
| [L-1](#L-1) | Missing checks for `address(0)` when assigning values to address state variables | 1 |
| [L-2](#L-2) | `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()` | 1 |
| [L-3](#L-3) | Unsafe ERC20 operation(s) | 1 |
| [L-4](#L-4) | Unspecific compiler version pragma | 1 |
| [GAS-1](#GAS-1) | Using bools for storage incurs overhead | 1 |
| [GAS-2](#GAS-2) | Use calldata instead of memory for function arguments that do not get mutated | 2 |
| [GAS-3](#GAS-3) | For Operations that will not overflow, you could use unchecked | 3 |
| [GAS-4](#GAS-4) | Avoid contract existence checks by using low level calls | 1 |
| [GAS-5](#GAS-5) | State variables only set in the constructor should be declared `immutable` | 4 |
| [GAS-6](#GAS-6) | Use != 0 instead of > 0 for unsigned integer comparison | 1 |
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 1 |
| [NC-2](#NC-2) | Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked` | 1 |
| [NC-3](#NC-3) | Control structures do not follow the Solidity Style Guide | 1 |
| [NC-4](#NC-4) | Functions should not be longer than 50 lines | 3 |
| [NC-5](#NC-5) | Change uint to uint256 | 1 |
| [NC-6](#NC-6) | Interfaces should be defined in separate files from their usage | 1 |
| [NC-7](#NC-7) | `mapping` definitions do not follow the Solidity Style Guide | 1 |
| [NC-8](#NC-8) | NatSpec is completely non-existent on functions that should have them | 3 |
| [NC-9](#NC-9) | `require()` / `revert()` statements should have descriptive reason strings | 2 |
| [NC-10](#NC-10) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-11](#NC-11) | Internal and private variables and functions names should begin with an underscore | 5 |



### <a name="M-1"></a>[M-1] `call()` should be used instead of `transfer()` on an `address payable`
The use of the deprecated `transfer()` function for an address may make the transaction fail due to the 2300 gas stipend

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

35:         payable(msg.sender).transfer(share); // paid again!

```

### <a name="L-1"></a>[L-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

21:         admin = _admin;

```

### <a name="L-2"></a>[L-2] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`
Use `abi.encode()` instead which will pad items to 32 bytes, which will [prevent hash collisions](https://docs.soliditylang.org/en/v0.8.13/abi-spec.html#non-standard-packed-mode) (e.g. `abi.encodePacked(0x123,0x456)` => `0x123456` => `abi.encodePacked(0x1,0x23456)`, but `abi.encode(0x123,0x456)` => `0x0...1230...456`). "Unless there is a compelling reason, `abi.encode` should be preferred". If there is only one argument to `abi.encodePacked()` it can often be cast to `bytes()` or `bytes32()` [instead](https://ethereum.stackexchange.com/questions/30912/how-to-compare-strings-in-solidity#answer-82739).
If all arguments are strings and or bytes, `bytes.concat()` should be used instead

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

25:         bytes memory mesg = abi.encodePacked("give me the money", msg.sender);

```

### <a name="L-3"></a>[L-3] Unsafe ERC20 operation(s)

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

35:         payable(msg.sender).transfer(share); // paid again!

```

### <a name="L-4"></a>[L-4] Unspecific compiler version pragma

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

2: pragma solidity >=0.8.17;

```

### <a name="GAS-1"></a>[GAS-1] Using bools for storage incurs overhead
Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

11:     mapping (bytes => bool) private paid;

```

### <a name="GAS-2"></a>[GAS-2] Use calldata instead of memory for function arguments that do not get mutated
When a function with a `memory` array is called externally, the `abi.decode()` step has to use a for-loop to copy each index of the `calldata` to the `memory` index. Each iteration of this for-loop costs at least 60 gas (i.e. `60 * <mem_array>.length`). Using `calldata` directly bypasses this loop. 

If the array is passed to an `internal` function which passes the array to another internal function where the array is modified and therefore `memory` is used in the `external` call, it's still more gas-efficient to use `calldata` when the `external` function uses modifiers, since the modifiers may prevent the internal functions from being called. Structs have the same overhead as an array of length one. 

 *Saves 60 gas per instance*

*Instances (2)*:
```solidity
File: SignatureMaleability.sol

5:    function recover(bytes32 hash, bytes memory signature) external returns (address);

24:     function distribute(bytes memory signature) external {

```

### <a name="GAS-3"></a>[GAS-3] For Operations that will not overflow, you could use unchecked

*Instances (3)*:
```solidity
File: SignatureMaleability.sol

32:         require(addr == admin); // replay admin

33:         require(!paid[signature]); // this remains be true for a different signature

35:         payable(msg.sender).transfer(share); // paid again!

```

### <a name="GAS-4"></a>[GAS-4] Avoid contract existence checks by using low level calls
Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

28:         address addr = ecdsa.recover(

```

### <a name="GAS-5"></a>[GAS-5] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (4)*:
```solidity
File: SignatureMaleability.sol

18:         owner = msg.sender;

19:         share = msg.value;

20:         ecdsa = _ecdsa;

21:         admin = _admin;

```

### <a name="GAS-6"></a>[GAS-6] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

2: pragma solidity >=0.8.17;

```

### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

21:         admin = _admin;

```

### <a name="NC-2"></a>[NC-2] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`
Solidity version 0.8.4 introduces `bytes.concat()` (vs `abi.encodePacked(<bytes>,<bytes>)`)

Solidity version 0.8.12 introduces `string.concat()` (vs `abi.encodePacked(<str>,<str>), which catches concatenation errors (in the event of a `bytes` data mixed in the concatenation)`)

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

25:         bytes memory mesg = abi.encodePacked("give me the money", msg.sender);

```

### <a name="NC-3"></a>[NC-3] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

33:         require(!paid[signature]); // this remains be true for a different signature

```

### <a name="NC-4"></a>[NC-4] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (3)*:
```solidity
File: SignatureMaleability.sol

5:    function recover(bytes32 hash, bytes memory signature) external returns (address);

6:    function toEthSignedMessageHash(bytes32 hash) external returns (bytes32);

24:     function distribute(bytes memory signature) external {

```

### <a name="NC-5"></a>[NC-5] Change uint to uint256
Throughout the code base, some variables are declared as `uint`. To favor explicitness, consider changing all instances of `uint` to `uint256`

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

13:     uint private share;

```

### <a name="NC-6"></a>[NC-6] Interfaces should be defined in separate files from their usage
The interfaces below should be defined in separate files, so that it's easier for future projects to import them, and to avoid duplication later on if they need to be used elsewhere in the project

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

4: interface ECDSA {

```

### <a name="NC-7"></a>[NC-7] `mapping` definitions do not follow the Solidity Style Guide
See the [mappings](https://docs.soliditylang.org/en/latest/style-guide.html#mappings) section of the Solidity Style Guide

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

11:     mapping (bytes => bool) private paid;

```

### <a name="NC-8"></a>[NC-8] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (3)*:
```solidity
File: SignatureMaleability.sol

5:    function recover(bytes32 hash, bytes memory signature) external returns (address);

6:    function toEthSignedMessageHash(bytes32 hash) external returns (bytes32);

24:     function distribute(bytes memory signature) external {

```

### <a name="NC-9"></a>[NC-9] `require()` / `revert()` statements should have descriptive reason strings

*Instances (2)*:
```solidity
File: SignatureMaleability.sol

32:         require(addr == admin); // replay admin

33:         require(!paid[signature]); // this remains be true for a different signature

```

### <a name="NC-10"></a>[NC-10] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: SignatureMaleability.sol

1: 
   Current order:
   FunctionDefinition.recover
   FunctionDefinition.toEthSignedMessageHash
   VariableDeclaration.paid
   VariableDeclaration.owner
   VariableDeclaration.share
   VariableDeclaration.ecdsa
   VariableDeclaration.admin
   FunctionDefinition.constructor
   FunctionDefinition.distribute
   
   Suggested order:
   VariableDeclaration.paid
   VariableDeclaration.owner
   VariableDeclaration.share
   VariableDeclaration.ecdsa
   VariableDeclaration.admin
   FunctionDefinition.recover
   FunctionDefinition.toEthSignedMessageHash
   FunctionDefinition.constructor
   FunctionDefinition.distribute

```

### <a name="NC-11"></a>[NC-11] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (5)*:
```solidity
File: SignatureMaleability.sol

11:     mapping (bytes => bool) private paid;

12:     address private owner;

13:     uint private share;

14:     ECDSA private ecdsa;

15:     address private admin;

```

