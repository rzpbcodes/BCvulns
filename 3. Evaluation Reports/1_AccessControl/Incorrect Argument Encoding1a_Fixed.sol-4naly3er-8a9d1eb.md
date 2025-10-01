# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 1 |
| [M-2](#M-2) | Lack of EIP-712 compliance: using `keccak256()` directly on an array or struct variable | 1 |
| [M-3](#M-3) | Library function isn't `internal` or `private` | 1 |
| [L-1](#L-1) | Use of `ecrecover` is susceptible to signature malleability | 1 |
| [L-2](#L-2) | `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()` | 4 |
| [L-3](#L-3) | Division by zero not prevented | 10 |
| [L-4](#L-4) | `domainSeparator()` isn't protected against replay attacks in case of a future chain split  | 2 |
| [L-5](#L-5) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-6](#L-6) | File allows a version of solidity that is susceptible to an assembly optimizer bug | 1 |
| [L-7](#L-7) | Use of ecrecover is susceptible to signature malleability | 1 |
| [GAS-1](#GAS-1) | `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings) | 21 |
| [GAS-2](#GAS-2) | Use assembly to check for `address(0)` | 1 |
| [GAS-3](#GAS-3) | Using bools for storage incurs overhead | 2 |
| [GAS-4](#GAS-4) | Cache array length outside of loop | 2 |
| [GAS-5](#GAS-5) | For Operations that will not overflow, you could use unchecked | 79 |
| [GAS-6](#GAS-6) | Use Custom Errors instead of Revert Strings to save Gas | 6 |
| [GAS-7](#GAS-7) | Avoid contract existence checks by using low level calls | 1 |
| [GAS-8](#GAS-8) | `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`) | 3 |
| [GAS-9](#GAS-9) | Use shift right/left instead of division/multiplication if possible | 1 |
| [GAS-10](#GAS-10) | Increments/decrements can be unchecked in for-loops | 3 |
| [GAS-11](#GAS-11) | Use != 0 instead of > 0 for unsigned integer comparison | 15 |
| [GAS-12](#GAS-12) | `internal` functions not called by the contract should be removed | 15 |
| [NC-1](#NC-1) | Array indices should be referenced via `enum`s rather than via numeric literals | 2 |
| [NC-2](#NC-2) | Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked` | 3 |
| [NC-3](#NC-3) | `constant`s should be defined rather than using magic numbers | 71 |
| [NC-4](#NC-4) | Control structures do not follow the Solidity Style Guide | 3 |
| [NC-5](#NC-5) | Dangerous `while(true)` loop | 1 |
| [NC-6](#NC-6) | Function ordering does not follow the Solidity style guide | 1 |
| [NC-7](#NC-7) | Functions should not be longer than 50 lines | 35 |
| [NC-8](#NC-8) | NatSpec is completely non-existent on functions that should have them | 1 |
| [NC-9](#NC-9) | File's first line is not an SPDX Identifier | 1 |
| [NC-10](#NC-10) | Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor | 1 |
| [NC-11](#NC-11) | Consider using named mappings | 2 |
| [NC-12](#NC-12) | Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables | 1 |
| [NC-13](#NC-13) | Adding a `return` statement when the function defines a named return variable, is redundant | 2 |
| [NC-14](#NC-14) | Use scientific notation (e.g. `1e18`) rather than exponentiation (e.g. `10**18`) | 13 |
| [NC-15](#NC-15) | Strings should use double quotes rather than single quotes | 1 |
| [NC-16](#NC-16) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-17](#NC-17) | Internal and private variables and functions names should begin with an underscore | 36 |
| [NC-18](#NC-18) | Variables need not be initialized to zero | 5 |



### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

649: contract AccessControl {

```

### <a name="M-2"></a>[M-2] Lack of EIP-712 compliance: using `keccak256()` directly on an array or struct variable
Directly using the actual variable instead of encoding the array values goes against the EIP-712 specification https://github.com/ethereum/EIPs/blob/master/EIPS/eip-712.md#definition-of-encodedata. 
**Note**: OpenSea's [Seaport's example with offerHashes and considerationHashes](https://github.com/ProjectOpenSea/seaport/blob/a62c2f8f484784735025d7b03ccb37865bc39e5a/reference/lib/ReferenceGettersAndDerivers.sol#L130-L131) can be used as a reference to understand how array of structs should be encoded.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

663:             bytes32 hash = keccak256(abi.encode(admins, regularUsers));

```

### <a name="M-3"></a>[M-3] Library function isn't `internal` or `private`
In a library, using an external or public visibility means that we won't be going through the library with a DELEGATECALL but with a CALL. This changes the context and should be done carefully.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

654:     function addUsers(

```

### <a name="L-1"></a>[L-1] Use of `ecrecover` is susceptible to signature malleability
The built-in EVM precompile `ecrecover` is susceptible to signature malleability, which could lead to replay attacks.
References:  <https://swcregistry.io/docs/SWC-117>,  <https://swcregistry.io/docs/SWC-121>, and  <https://medium.com/cryptronics/signature-replay-vulnerabilities-in-smart-contracts-3b6f7596df57>.
While this is not immediately exploitable, this may become a vulnerability if used elsewhere.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

570:         address signer = ecrecover(hash, v, r, s);

```

### <a name="L-2"></a>[L-2] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`
Use `abi.encode()` instead which will pad items to 32 bytes, which will [prevent hash collisions](https://docs.soliditylang.org/en/v0.8.13/abi-spec.html#non-standard-packed-mode) (e.g. `abi.encodePacked(0x123,0x456)` => `0x123456` => `abi.encodePacked(0x1,0x23456)`, but `abi.encode(0x123,0x456)` => `0x0...1230...456`). "Unless there is a compelling reason, `abi.encode` should be preferred". If there is only one argument to `abi.encodePacked()` it can often be cast to `bytes()` or `bytes32()` [instead](https://ethereum.stackexchange.com/questions/30912/how-to-compare-strings-in-solidity#answer-82739).
If all arguments are strings and or bytes, `bytes.concat()` should be used instead

*Instances (4)*:
```solidity
File: 7-3-41a_Fixed.sol

403:         return string(abi.encodePacked(value < 0 ? "-" : "", toString(SignedMath.abs(value))));

616:         return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n", Strings.toString(s.length), s));

617:     }

646:         return keccak256(abi.encodePacked("\x19\x00", validator, data));

```

### <a name="L-3"></a>[L-3] Division by zero not prevented
The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (10)*:
```solidity
File: 7-3-41a_Fixed.sol

77:         return a == 0 ? 0 : (a - 1) / b + 1;

103:                 return prod0 / denominator;

204:             result = (result + a / result) >> 1;

205:             result = (result + a / result) >> 1;

206:             result = (result + a / result) >> 1;

207:             result = (result + a / result) >> 1;

208:             result = (result + a / result) >> 1;

209:             result = (result + a / result) >> 1;

210:             result = (result + a / result) >> 1;

211:             return min(result, a / result);

```

### <a name="L-4"></a>[L-4] `domainSeparator()` isn't protected against replay attacks in case of a future chain split 
Severity: Low.
Description: See <https://eips.ethereum.org/EIPS/eip-2612#security-considerations>.
Remediation: Consider using the [implementation](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/EIP712.sol#L77-L90) from OpenZeppelin, which recalculates the domain separator if the current `block.chainid` is not the cached chain ID.
Past occurrences of this issue:
- [Reality Cards Contest](https://github.com/code-423n4/2021-06-realitycards-findings/issues/166)
- [Swivel Contest](https://github.com/code-423n4/2021-09-swivel-findings/issues/98)
- [Malt Finance Contest](https://github.com/code-423n4/2021-11-malt-findings/issues/349)

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

628:     function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 data) {

633:             mstore(add(ptr, 0x02), domainSeparator)

```

### <a name="L-5"></a>[L-5] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="L-6"></a>[L-6] File allows a version of solidity that is susceptible to an assembly optimizer bug
In solidity versions 0.8.13 and 0.8.14, there is an [optimizer bug](https://github.com/ethereum/solidity-blog/blob/499ab8abc19391be7b7b34f88953a067029a5b45/_posts/2022-06-15-inline-assembly-memory-side-effects-bug.md) where, if the use of a variable is in a separate `assembly` block from the block in which it was stored, the `mstore` operation is optimized out, leading to uninitialized memory. The code currently does not have such a pattern of execution, but it does use `mstore`s in `assembly` blocks, so it is a risk for future changes. The affected solidity versions should be avoided if at all possible.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="L-7"></a>[L-7] Use of ecrecover is susceptible to signature malleability
The built-in EVM precompile ecrecover is susceptible to signature malleability, which could lead to replay attacks.Consider using OpenZeppelin’s ECDSA library instead of the built-in function.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

570:         address signer = ecrecover(hash, v, r, s);

```

### <a name="GAS-1"></a>[GAS-1] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)
This saves **16 gas per instance.**

*Instances (21)*:
```solidity
File: 7-3-41a_Fixed.sol

172:             result += 1;

234:                 result += 128;

238:                 result += 64;

242:                 result += 32;

246:                 result += 16;

250:                 result += 8;

254:                 result += 4;

258:                 result += 2;

261:                 result += 1;

287:                 result += 64;

291:                 result += 32;

295:                 result += 16;

299:                 result += 8;

303:                 result += 4;

307:                 result += 2;

310:                 result += 1;

338:                 result += 16;

342:                 result += 8;

346:                 result += 4;

350:                 result += 2;

353:                 result += 1;

```

### <a name="GAS-2"></a>[GAS-2] Use assembly to check for `address(0)`
*Saves 6 gas per instance*

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

571:         if (signer == address(0)) {

```

### <a name="GAS-3"></a>[GAS-3] Using bools for storage incurs overhead
Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

651:     mapping(address => bool) isAdmin;

652:     mapping(address => bool) isRegularUser;

```

### <a name="GAS-4"></a>[GAS-4] Cache array length outside of loop
If not cached, the solidity compiler will always read the length of the array during each iteration. That is, if it is a storage array, this is an extra sload operation (100 additional extra gas for each iteration except for the first) and if it is a memory array, this is an extra mload operation (3 additional gas for each iteration except for the first).

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

668:         for (uint256 i = 0; i < admins.length; i++) {

671:         for (uint256 i = 0; i < regularUsers.length; i++) {

```

### <a name="GAS-5"></a>[GAS-5] For Operations that will not overflow, you could use unchecked

*Instances (79)*:
```solidity
File: 7-3-41a_Fixed.sol

24:         int256 x = (a & b) + ((a ^ b) >> 1);

25:         return x + (int256(uint256(x) >> 255) & (a ^ b));

34:             return uint256(n >= 0 ? n : -n);

41:         Down, // Toward negative infinity

42:         Up, // Toward infinity

43:         Zero // Toward zero

66:         return (a & b) + (a ^ b) / 2;

77:         return a == 0 ? 0 : (a - 1) / b + 1;

90:             uint256 prod0; // Least significant 256 bits of the product

91:             uint256 prod1; // Most significant 256 bits of the product

103:                 return prod0 / denominator;

128:             uint256 twos = denominator & (~denominator + 1);

141:             prod0 |= prod1 * twos;

146:             uint256 inverse = (3 * denominator) ^ 2;

150:             inverse *= 2 - denominator * inverse; // inverse mod 2^8

151:             inverse *= 2 - denominator * inverse; // inverse mod 2^16

152:             inverse *= 2 - denominator * inverse; // inverse mod 2^32

153:             inverse *= 2 - denominator * inverse; // inverse mod 2^64

154:             inverse *= 2 - denominator * inverse; // inverse mod 2^128

155:             inverse *= 2 - denominator * inverse; // inverse mod 2^256

161:             result = prod0 * inverse;

172:             result += 1;

204:             result = (result + a / result) >> 1;

205:             result = (result + a / result) >> 1;

206:             result = (result + a / result) >> 1;

207:             result = (result + a / result) >> 1;

208:             result = (result + a / result) >> 1;

209:             result = (result + a / result) >> 1;

210:             result = (result + a / result) >> 1;

211:             return min(result, a / result);

221:             return result + (rounding == Rounding.Up && result * result < a ? 1 : 0);

234:                 result += 128;

238:                 result += 64;

242:                 result += 32;

246:                 result += 16;

250:                 result += 8;

254:                 result += 4;

258:                 result += 2;

261:                 result += 1;

274:             return result + (rounding == Rounding.Up && 1 << result < value ? 1 : 0);

285:             if (value >= 10 ** 64) {

286:                 value /= 10 ** 64;

287:                 result += 64;

289:             if (value >= 10 ** 32) {

290:                 value /= 10 ** 32;

291:                 result += 32;

293:             if (value >= 10 ** 16) {

294:                 value /= 10 ** 16;

295:                 result += 16;

297:             if (value >= 10 ** 8) {

298:                 value /= 10 ** 8;

299:                 result += 8;

301:             if (value >= 10 ** 4) {

302:                 value /= 10 ** 4;

303:                 result += 4;

305:             if (value >= 10 ** 2) {

306:                 value /= 10 ** 2;

307:                 result += 2;

309:             if (value >= 10 ** 1) {

310:                 result += 1;

323:             return result + (rounding == Rounding.Up && 10 ** result < value ? 1 : 0);

338:                 result += 16;

342:                 result += 8;

346:                 result += 4;

350:                 result += 2;

353:                 result += 1;

366:             return result + (rounding == Rounding.Up && 1 << (result << 3) < value ? 1 : 0);

379:             uint256 length = Math.log10(value) + 1;

387:                 ptr--;

392:                 value /= 10;

403:         return string(abi.encodePacked(value < 0 ? "-" : "", toString(SignedMath.abs(value))));

411:             return toHexString(value, Math.log256(value) + 1);

419:         bytes memory buffer = new bytes(2 * length + 2);

422:         for (uint256 i = 2 * length + 1; i > 1; --i) {

451:         InvalidSignatureV // Deprecated in v4.8

456:             return; // no error: do nothing

534:         uint8 v = uint8((uint256(vs) >> 255) + 27);

668:         for (uint256 i = 0; i < admins.length; i++) {

671:         for (uint256 i = 0; i < regularUsers.length; i++) {

```

### <a name="GAS-6"></a>[GAS-6] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (6)*:
```solidity
File: 7-3-41a_Fixed.sol

107:             require(denominator > prod1, "Math: mulDiv overflow");

426:         require(value == 0, "Strings: hex length insufficient");

458:             revert("ECDSA: invalid signature");

460:             revert("ECDSA: invalid signature length");

462:             revert("ECDSA: invalid signature 's' value");

666:             require(isAdmin[signer], "Only admins can add users.");

```

### <a name="GAS-7"></a>[GAS-7] Avoid contract existence checks by using low level calls
Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

665:             address signer = hash.toEthSignedMessageHash().recover(signature);

```

### <a name="GAS-8"></a>[GAS-8] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)
Pre-increments and pre-decrements are cheaper.

For a `uint256 i` variable, the following is true with the Optimizer enabled at 10k:

**Increment:**

- `i += 1` is the most expensive form
- `i++` costs 6 gas less than `i += 1`
- `++i` costs 5 gas less than `i++` (11 gas less than `i += 1`)

**Decrement:**

- `i -= 1` is the most expensive form
- `i--` costs 11 gas less than `i -= 1`
- `--i` costs 5 gas less than `i--` (16 gas less than `i -= 1`)

Note that post-increments (or post-decrements) return the old value before incrementing or decrementing, hence the name *post-increment*:

```solidity
uint i = 1;  
uint j = 2;
require(j == i++, "This will be false as i is incremented after the comparison");
```
  
However, pre-increments (or pre-decrements) return the new value:
  
```solidity
uint i = 1;  
uint j = 2;
require(j == ++i, "This will be true as i is incremented before the comparison");
```

In the pre-increment case, the compiler has to create a temporary variable (when used) for returning `1` instead of `2`.

Consider using pre-increments and pre-decrements where they are relevant (meaning: not where post-increments/decrements logic are relevant).

*Saves 5 gas per instance*

*Instances (3)*:
```solidity
File: 7-3-41a_Fixed.sol

387:                 ptr--;

668:         for (uint256 i = 0; i < admins.length; i++) {

671:         for (uint256 i = 0; i < regularUsers.length; i++) {

```

### <a name="GAS-9"></a>[GAS-9] Use shift right/left instead of division/multiplication if possible
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
File: 7-3-41a_Fixed.sol

66:         return (a & b) + (a ^ b) / 2;

```

### <a name="GAS-10"></a>[GAS-10] Increments/decrements can be unchecked in for-loops
In Solidity 0.8+, there's a default overflow check on unsigned integers. It's possible to uncheck this in for-loops and save some gas at each iteration, but at the cost of some code readability, as this uncheck cannot be made inline.

[ethereum/solidity#10695](https://github.com/ethereum/solidity/issues/10695)

The change would be:

```diff
- for (uint256 i; i < numIterations; i++) {
+ for (uint256 i; i < numIterations;) {
 // ...  
+   unchecked { ++i; }
}  
```

These save around **25 gas saved** per instance.

The same can be applied with decrements (which should use `break` when `i == 0`).

The risk of overflow is non-existent for `uint256`.

*Instances (3)*:
```solidity
File: 7-3-41a_Fixed.sol

422:         for (uint256 i = 2 * length + 1; i > 1; --i) {

668:         for (uint256 i = 0; i < admins.length; i++) {

671:         for (uint256 i = 0; i < regularUsers.length; i++) {

```

### <a name="GAS-11"></a>[GAS-11] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (15)*:
```solidity
File: 7-3-41a_Fixed.sol

171:         if (rounding == Rounding.Up && mulmod(x, y, denominator) > 0) {

232:             if (value >> 128 > 0) {

236:             if (value >> 64 > 0) {

240:             if (value >> 32 > 0) {

244:             if (value >> 16 > 0) {

248:             if (value >> 8 > 0) {

252:             if (value >> 4 > 0) {

256:             if (value >> 2 > 0) {

260:             if (value >> 1 > 0) {

336:             if (value >> 128 > 0) {

340:             if (value >> 64 > 0) {

344:             if (value >> 32 > 0) {

348:             if (value >> 16 > 0) {

352:             if (value >> 8 > 0) {

565:         if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {

```

### <a name="GAS-12"></a>[GAS-12] `internal` functions not called by the contract should be removed
If the functions are required by an interface, the contract should inherit from that interface and use the `override` keyword

*Instances (15)*:
```solidity
File: 7-3-41a_Fixed.sol

7:     function max(int256 a, int256 b) internal pure returns (int256) {

14:     function min(int256 a, int256 b) internal pure returns (int256) {

22:     function average(int256 a, int256 b) internal pure returns (int256) {

31:     function abs(int256 n) internal pure returns (uint256) {

49:     function max(uint256 a, uint256 b) internal pure returns (uint256) {

64:     function average(uint256 a, uint256 b) internal pure returns (uint256) {

75:     function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {

440:     function equal(string memory a, string memory b) internal pure returns (bool) {

519:     function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {

543:     function recover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address) {

582:     function recover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {

596:     function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32 message) {

615:     function toEthSignedMessageHash(bytes memory s) internal pure returns (bytes32) {

628:     function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 data) {

645:     function toDataWithIntendedValidatorHash(address validator, bytes memory data) internal pure returns (bytes32) {

```

### <a name="NC-1"></a>[NC-1] Array indices should be referenced via `enum`s rather than via numeric literals

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

420:         buffer[0] = "0";

421:         buffer[1] = "x";

```

### <a name="NC-2"></a>[NC-2] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`
Solidity version 0.8.4 introduces `bytes.concat()` (vs `abi.encodePacked(<bytes>,<bytes>)`)

Solidity version 0.8.12 introduces `string.concat()` (vs `abi.encodePacked(<str>,<str>), which catches concatenation errors (in the event of a `bytes` data mixed in the concatenation)`)

*Instances (3)*:
```solidity
File: 7-3-41a_Fixed.sol

403:         return string(abi.encodePacked(value < 0 ? "-" : "", toString(SignedMath.abs(value))));

616:         return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n", Strings.toString(s.length), s));

646:         return keccak256(abi.encodePacked("\x19\x00", validator, data));

```

### <a name="NC-3"></a>[NC-3] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (71)*:
```solidity
File: 7-3-41a_Fixed.sol

25:         return x + (int256(uint256(x) >> 255) & (a ^ b));

66:         return (a & b) + (a ^ b) / 2;

146:             uint256 inverse = (3 * denominator) ^ 2;

150:             inverse *= 2 - denominator * inverse; // inverse mod 2^8

151:             inverse *= 2 - denominator * inverse; // inverse mod 2^16

152:             inverse *= 2 - denominator * inverse; // inverse mod 2^32

153:             inverse *= 2 - denominator * inverse; // inverse mod 2^64

154:             inverse *= 2 - denominator * inverse; // inverse mod 2^128

155:             inverse *= 2 - denominator * inverse; // inverse mod 2^256

232:             if (value >> 128 > 0) {

233:                 value >>= 128;

234:                 result += 128;

236:             if (value >> 64 > 0) {

237:                 value >>= 64;

238:                 result += 64;

240:             if (value >> 32 > 0) {

241:                 value >>= 32;

242:                 result += 32;

244:             if (value >> 16 > 0) {

245:                 value >>= 16;

246:                 result += 16;

248:             if (value >> 8 > 0) {

249:                 value >>= 8;

250:                 result += 8;

252:             if (value >> 4 > 0) {

253:                 value >>= 4;

254:                 result += 4;

256:             if (value >> 2 > 0) {

257:                 value >>= 2;

258:                 result += 2;

285:             if (value >= 10 ** 64) {

286:                 value /= 10 ** 64;

287:                 result += 64;

289:             if (value >= 10 ** 32) {

290:                 value /= 10 ** 32;

291:                 result += 32;

293:             if (value >= 10 ** 16) {

294:                 value /= 10 ** 16;

295:                 result += 16;

297:             if (value >= 10 ** 8) {

298:                 value /= 10 ** 8;

299:                 result += 8;

301:             if (value >= 10 ** 4) {

302:                 value /= 10 ** 4;

303:                 result += 4;

305:             if (value >= 10 ** 2) {

306:                 value /= 10 ** 2;

307:                 result += 2;

309:             if (value >= 10 ** 1) {

323:             return result + (rounding == Rounding.Up && 10 ** result < value ? 1 : 0);

336:             if (value >> 128 > 0) {

337:                 value >>= 128;

338:                 result += 16;

340:             if (value >> 64 > 0) {

341:                 value >>= 64;

342:                 result += 8;

344:             if (value >> 32 > 0) {

345:                 value >>= 32;

346:                 result += 4;

348:             if (value >> 16 > 0) {

349:                 value >>= 16;

350:                 result += 2;

352:             if (value >> 8 > 0) {

366:             return result + (rounding == Rounding.Up && 1 << (result << 3) < value ? 1 : 0);

390:                     mstore8(ptr, byte(mod(value, 10), _SYMBOLS))

392:                 value /= 10;

419:         bytes memory buffer = new bytes(2 * length + 2);

422:         for (uint256 i = 2 * length + 1; i > 1; --i) {

424:             value >>= 4;

487:         if (signature.length == 65) {

534:         uint8 v = uint8((uint256(vs) >> 255) + 27);

```

### <a name="NC-4"></a>[NC-4] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (3)*:
```solidity
File: 7-3-41a_Fixed.sol

90:             uint256 prod0; // Least significant 256 bits of the product

91:             uint256 prod1; // Most significant 256 bits of the product

393:                 if (value == 0) break;

```

### <a name="NC-5"></a>[NC-5] Dangerous `while(true)` loop
Consider using for-loops to avoid all risks of an infinite-loop situation

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

386:             while (true) {

```

### <a name="NC-6"></a>[NC-6] Function ordering does not follow the Solidity style guide
According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: 
   Current order:
   internal max
   internal min
   internal average
   internal abs
   internal max
   internal min
   internal average
   internal ceilDiv
   internal mulDiv
   internal mulDiv
   internal sqrt
   internal sqrt
   internal log2
   internal log2
   internal log10
   internal log10
   internal log256
   internal log256
   internal toString
   internal toString
   internal toHexString
   internal toHexString
   internal toHexString
   internal equal
   private _throwError
   internal tryRecover
   internal recover
   internal tryRecover
   internal recover
   internal tryRecover
   internal recover
   internal toEthSignedMessageHash
   internal toEthSignedMessageHash
   internal toTypedDataHash
   internal toDataWithIntendedValidatorHash
   external addUsers
   
   Suggested order:
   external addUsers
   internal max
   internal min
   internal average
   internal abs
   internal max
   internal min
   internal average
   internal ceilDiv
   internal mulDiv
   internal mulDiv
   internal sqrt
   internal sqrt
   internal log2
   internal log2
   internal log10
   internal log10
   internal log256
   internal log256
   internal toString
   internal toString
   internal toHexString
   internal toHexString
   internal toHexString
   internal equal
   internal tryRecover
   internal recover
   internal tryRecover
   internal recover
   internal tryRecover
   internal recover
   internal toEthSignedMessageHash
   internal toEthSignedMessageHash
   internal toTypedDataHash
   internal toDataWithIntendedValidatorHash
   private _throwError

```

### <a name="NC-7"></a>[NC-7] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (35)*:
```solidity
File: 7-3-41a_Fixed.sol

7:     function max(int256 a, int256 b) internal pure returns (int256) {

14:     function min(int256 a, int256 b) internal pure returns (int256) {

22:     function average(int256 a, int256 b) internal pure returns (int256) {

31:     function abs(int256 n) internal pure returns (uint256) {

49:     function max(uint256 a, uint256 b) internal pure returns (uint256) {

56:     function min(uint256 a, uint256 b) internal pure returns (uint256) {

64:     function average(uint256 a, uint256 b) internal pure returns (uint256) {

75:     function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {

85:     function mulDiv(uint256 x, uint256 y, uint256 denominator) internal pure returns (uint256 result) {

169:     function mulDiv(uint256 x, uint256 y, uint256 denominator, Rounding rounding) internal pure returns (uint256) {

182:     function sqrt(uint256 a) internal pure returns (uint256) {

218:     function sqrt(uint256 a, Rounding rounding) internal pure returns (uint256) {

229:     function log2(uint256 value) internal pure returns (uint256) {

271:     function log2(uint256 value, Rounding rounding) internal pure returns (uint256) {

282:     function log10(uint256 value) internal pure returns (uint256) {

320:     function log10(uint256 value, Rounding rounding) internal pure returns (uint256) {

333:     function log256(uint256 value) internal pure returns (uint256) {

363:     function log256(uint256 value, Rounding rounding) internal pure returns (uint256) {

377:     function toString(uint256 value) internal pure returns (string memory) {

402:     function toString(int256 value) internal pure returns (string memory) {

409:     function toHexString(uint256 value) internal pure returns (string memory) {

418:     function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {

433:     function toHexString(address addr) internal pure returns (string memory) {

440:     function equal(string memory a, string memory b) internal pure returns (bool) {

454:     function _throwError(RecoverError error) private pure {

486:     function tryRecover(bytes32 hash, bytes memory signature) internal pure returns (address, RecoverError) {

519:     function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {

532:     function tryRecover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address, RecoverError) {

543:     function recover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address) {

555:     function tryRecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address, RecoverError) {

582:     function recover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {

596:     function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32 message) {

615:     function toEthSignedMessageHash(bytes memory s) internal pure returns (bytes32) {

628:     function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 data) {

645:     function toDataWithIntendedValidatorHash(address validator, bytes memory data) internal pure returns (bytes32) {

```

### <a name="NC-8"></a>[NC-8] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

654:     function addUsers(

```

### <a name="NC-9"></a>[NC-9] File's first line is not an SPDX Identifier

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="NC-10"></a>[NC-10] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor
If a function is supposed to be access-controlled, a `modifier` should be used instead of a `require/if` statement for more readability.

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

661:         if (!isAdmin[msg.sender]) {

```

### <a name="NC-11"></a>[NC-11] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

651:     mapping(address => bool) isAdmin;

652:     mapping(address => bool) isRegularUser;

```

### <a name="NC-12"></a>[NC-12] Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables
If the variable needs to be different based on which class it comes from, a `view`/`pure` *function* should be used instead (e.g. like [this](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/76eee35971c2541585e05cbf258510dda7b2fbc6/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L59)).

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: pragma solidity ^0.8.0;

```

### <a name="NC-13"></a>[NC-13] Adding a `return` statement when the function defines a named return variable, is redundant

*Instances (2)*:
```solidity
File: 7-3-41a_Fixed.sol

80:     /**
         * @notice Calculates floor(x * y / denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
         * @dev Original credit to Remco Bloemen under MIT license (https://xn--2-umb.com/21/muldiv)
         * with further edits by Uniswap Labs also under MIT license.
         */
        function mulDiv(uint256 x, uint256 y, uint256 denominator) internal pure returns (uint256 result) {
            unchecked {
                // 512-bit multiply [prod1 prod0] = x * y. Compute the product mod 2^256 and mod 2^256 - 1, then use
                // use the Chinese Remainder Theorem to reconstruct the 512 bit result. The result is stored in two 256
                // variables such that product = prod1 * 2^256 + prod0.
                uint256 prod0; // Least significant 256 bits of the product
                uint256 prod1; // Most significant 256 bits of the product
                assembly {
                    let mm := mulmod(x, y, not(0))
                    prod0 := mul(x, y)
                    prod1 := sub(sub(mm, prod0), lt(mm, prod0))
                }
    
                // Handle non-overflow cases, 256 by 256 division.
                if (prod1 == 0) {
                    // Solidity will revert if denominator == 0, unlike the div opcode on its own.
                    // The surrounding unchecked block does not change this fact.
                    // See https://docs.soliditylang.org/en/latest/control-structures.html#checked-or-unchecked-arithmetic.
                    return prod0 / denominator;
                }
    
                // Make sure the result is less than 2^256. Also prevents denominator == 0.
                require(denominator > prod1, "Math: mulDiv overflow");
    
                ///////////////////////////////////////////////
                // 512 by 256 division.
                ///////////////////////////////////////////////
    
                // Make division exact by subtracting the remainder from [prod1 prod0].
                uint256 remainder;
                assembly {
                    // Compute remainder using mulmod.
                    remainder := mulmod(x, y, denominator)
    
                    // Subtract 256 bit number from 512 bit number.
                    prod1 := sub(prod1, gt(remainder, prod0))
                    prod0 := sub(prod0, remainder)
                }
    
                // Factor powers of two out of denominator and compute largest power of two divisor of denominator. Always >= 1.
                // See https://cs.stackexchange.com/q/138556/92363.
    
                // Does not overflow because the denominator cannot be zero at this stage in the function.
                uint256 twos = denominator & (~denominator + 1);
                assembly {
                    // Divide denominator by twos.
                    denominator := div(denominator, twos)
    
                    // Divide [prod1 prod0] by twos.
                    prod0 := div(prod0, twos)
    
                    // Flip twos such that it is 2^256 / twos. If twos is zero, then it becomes one.
                    twos := add(div(sub(0, twos), twos), 1)
                }
    
                // Shift in bits from prod1 into prod0.
                prod0 |= prod1 * twos;
    
                // Invert denominator mod 2^256. Now that denominator is an odd number, it has an inverse modulo 2^256 such
                // that denominator * inv = 1 mod 2^256. Compute the inverse by starting with a seed that is correct for
                // four bits. That is, denominator * inv = 1 mod 2^4.
                uint256 inverse = (3 * denominator) ^ 2;
    
                // Use the Newton-Raphson iteration to improve the precision. Thanks to Hensel's lifting lemma, this also works
                // in modular arithmetic, doubling the correct bits in each step.
                inverse *= 2 - denominator * inverse; // inverse mod 2^8
                inverse *= 2 - denominator * inverse; // inverse mod 2^16
                inverse *= 2 - denominator * inverse; // inverse mod 2^32
                inverse *= 2 - denominator * inverse; // inverse mod 2^64
                inverse *= 2 - denominator * inverse; // inverse mod 2^128
                inverse *= 2 - denominator * inverse; // inverse mod 2^256
    
                // Because the division is now exact we can divide by multiplying with the modular inverse of denominator.
                // This will give us the correct result modulo 2^256. Since the preconditions guarantee that the outcome is
                // less than 2^256, this is the final result. We don't need to compute the high bits of the result and prod1
                // is no longer required.
                result = prod0 * inverse;
                return result;

80:     /**
         * @notice Calculates floor(x * y / denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
         * @dev Original credit to Remco Bloemen under MIT license (https://xn--2-umb.com/21/muldiv)
         * with further edits by Uniswap Labs also under MIT license.
         */
        function mulDiv(uint256 x, uint256 y, uint256 denominator) internal pure returns (uint256 result) {
            unchecked {
                // 512-bit multiply [prod1 prod0] = x * y. Compute the product mod 2^256 and mod 2^256 - 1, then use
                // use the Chinese Remainder Theorem to reconstruct the 512 bit result. The result is stored in two 256
                // variables such that product = prod1 * 2^256 + prod0.
                uint256 prod0; // Least significant 256 bits of the product
                uint256 prod1; // Most significant 256 bits of the product
                assembly {
                    let mm := mulmod(x, y, not(0))
                    prod0 := mul(x, y)
                    prod1 := sub(sub(mm, prod0), lt(mm, prod0))
                }
    
                // Handle non-overflow cases, 256 by 256 division.
                if (prod1 == 0) {
                    // Solidity will revert if denominator == 0, unlike the div opcode on its own.
                    // The surrounding unchecked block does not change this fact.
                    // See https://docs.soliditylang.org/en/latest/control-structures.html#checked-or-unchecked-arithmetic.
                    return prod0 / denominator;

```

### <a name="NC-14"></a>[NC-14] Use scientific notation (e.g. `1e18`) rather than exponentiation (e.g. `10**18`)
While this won't save gas in the recent solidity versions, this is shorter and more readable (this is especially true in calculations).

*Instances (13)*:
```solidity
File: 7-3-41a_Fixed.sol

285:             if (value >= 10 ** 64) {

286:                 value /= 10 ** 64;

289:             if (value >= 10 ** 32) {

290:                 value /= 10 ** 32;

293:             if (value >= 10 ** 16) {

294:                 value /= 10 ** 16;

297:             if (value >= 10 ** 8) {

298:                 value /= 10 ** 8;

301:             if (value >= 10 ** 4) {

302:                 value /= 10 ** 4;

305:             if (value >= 10 ** 2) {

306:                 value /= 10 ** 2;

309:             if (value >= 10 ** 1) {

```

### <a name="NC-15"></a>[NC-15] Strings should use double quotes rather than single quotes
See the Solidity Style Guide: https://docs.soliditylang.org/en/v0.8.20/style-guide.html#other-recommendations

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

462:             revert("ECDSA: invalid signature 's' value");

```

### <a name="NC-16"></a>[NC-16] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: 7-3-41a_Fixed.sol

1: 
   Current order:
   FunctionDefinition.max
   FunctionDefinition.min
   FunctionDefinition.average
   FunctionDefinition.abs
   EnumDefinition.Rounding
   FunctionDefinition.max
   FunctionDefinition.min
   FunctionDefinition.average
   FunctionDefinition.ceilDiv
   FunctionDefinition.mulDiv
   FunctionDefinition.mulDiv
   FunctionDefinition.sqrt
   FunctionDefinition.sqrt
   FunctionDefinition.log2
   FunctionDefinition.log2
   FunctionDefinition.log10
   FunctionDefinition.log10
   FunctionDefinition.log256
   FunctionDefinition.log256
   VariableDeclaration._SYMBOLS
   VariableDeclaration._ADDRESS_LENGTH
   FunctionDefinition.toString
   FunctionDefinition.toString
   FunctionDefinition.toHexString
   FunctionDefinition.toHexString
   FunctionDefinition.toHexString
   FunctionDefinition.equal
   EnumDefinition.RecoverError
   FunctionDefinition._throwError
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.toEthSignedMessageHash
   FunctionDefinition.toEthSignedMessageHash
   FunctionDefinition.toTypedDataHash
   FunctionDefinition.toDataWithIntendedValidatorHash
   UsingForDirective.ECDSA
   VariableDeclaration.isAdmin
   VariableDeclaration.isRegularUser
   FunctionDefinition.addUsers
   
   Suggested order:
   UsingForDirective.ECDSA
   VariableDeclaration._SYMBOLS
   VariableDeclaration._ADDRESS_LENGTH
   VariableDeclaration.isAdmin
   VariableDeclaration.isRegularUser
   EnumDefinition.Rounding
   EnumDefinition.RecoverError
   FunctionDefinition.max
   FunctionDefinition.min
   FunctionDefinition.average
   FunctionDefinition.abs
   FunctionDefinition.max
   FunctionDefinition.min
   FunctionDefinition.average
   FunctionDefinition.ceilDiv
   FunctionDefinition.mulDiv
   FunctionDefinition.mulDiv
   FunctionDefinition.sqrt
   FunctionDefinition.sqrt
   FunctionDefinition.log2
   FunctionDefinition.log2
   FunctionDefinition.log10
   FunctionDefinition.log10
   FunctionDefinition.log256
   FunctionDefinition.log256
   FunctionDefinition.toString
   FunctionDefinition.toString
   FunctionDefinition.toHexString
   FunctionDefinition.toHexString
   FunctionDefinition.toHexString
   FunctionDefinition.equal
   FunctionDefinition._throwError
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.tryRecover
   FunctionDefinition.recover
   FunctionDefinition.toEthSignedMessageHash
   FunctionDefinition.toEthSignedMessageHash
   FunctionDefinition.toTypedDataHash
   FunctionDefinition.toDataWithIntendedValidatorHash
   FunctionDefinition.addUsers

```

### <a name="NC-17"></a>[NC-17] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (36)*:
```solidity
File: 7-3-41a_Fixed.sol

7:     function max(int256 a, int256 b) internal pure returns (int256) {

14:     function min(int256 a, int256 b) internal pure returns (int256) {

22:     function average(int256 a, int256 b) internal pure returns (int256) {

31:     function abs(int256 n) internal pure returns (uint256) {

49:     function max(uint256 a, uint256 b) internal pure returns (uint256) {

56:     function min(uint256 a, uint256 b) internal pure returns (uint256) {

64:     function average(uint256 a, uint256 b) internal pure returns (uint256) {

75:     function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {

85:     function mulDiv(uint256 x, uint256 y, uint256 denominator) internal pure returns (uint256 result) {

169:     function mulDiv(uint256 x, uint256 y, uint256 denominator, Rounding rounding) internal pure returns (uint256) {

182:     function sqrt(uint256 a) internal pure returns (uint256) {

218:     function sqrt(uint256 a, Rounding rounding) internal pure returns (uint256) {

229:     function log2(uint256 value) internal pure returns (uint256) {

271:     function log2(uint256 value, Rounding rounding) internal pure returns (uint256) {

282:     function log10(uint256 value) internal pure returns (uint256) {

320:     function log10(uint256 value, Rounding rounding) internal pure returns (uint256) {

333:     function log256(uint256 value) internal pure returns (uint256) {

363:     function log256(uint256 value, Rounding rounding) internal pure returns (uint256) {

377:     function toString(uint256 value) internal pure returns (string memory) {

402:     function toString(int256 value) internal pure returns (string memory) {

409:     function toHexString(uint256 value) internal pure returns (string memory) {

418:     function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {

433:     function toHexString(address addr) internal pure returns (string memory) {

440:     function equal(string memory a, string memory b) internal pure returns (bool) {

486:     function tryRecover(bytes32 hash, bytes memory signature) internal pure returns (address, RecoverError) {

519:     function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {

532:     function tryRecover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address, RecoverError) {

543:     function recover(bytes32 hash, bytes32 r, bytes32 vs) internal pure returns (address) {

555:     function tryRecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address, RecoverError) {

582:     function recover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {

596:     function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32 message) {

615:     function toEthSignedMessageHash(bytes memory s) internal pure returns (bytes32) {

628:     function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 data) {

645:     function toDataWithIntendedValidatorHash(address validator, bytes memory data) internal pure returns (bytes32) {

651:     mapping(address => bool) isAdmin;

652:     mapping(address => bool) isRegularUser;

```

### <a name="NC-18"></a>[NC-18] Variables need not be initialized to zero
The default value for variables is zero, so initializing them to zero is superfluous.

*Instances (5)*:
```solidity
File: 7-3-41a_Fixed.sol

230:         uint256 result = 0;

283:         uint256 result = 0;

334:         uint256 result = 0;

668:         for (uint256 i = 0; i < admins.length; i++) {

671:         for (uint256 i = 0; i < regularUsers.length; i++) {

```

