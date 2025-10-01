**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [unchecked-lowlevel](#unchecked-lowlevel) (2 results) (Medium)
 - [uninitialized-local](#uninitialized-local) (2 results) (Medium)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
Reentrancy in [OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74):
	External calls:
	- [players[n % 2].addr.call.value(3000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L66)
	- [players[(n + 1) % 2].addr.call.value(1000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L69)
	State variables written after the call(s):
	- [delete players](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L72)
	[OddEven.players](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L16) can be used in cross function reentrancies:
	- [OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74)
	- [OddEven.play(bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L18-L35)
	- [OddEven.reveal(uint256,bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L37-L56)
	- [stage = Stage.FirstCommit](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L73)
	[OddEven.stage](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L17) can be used in cross function reentrancies:
	- [OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74)
	- [OddEven.play(bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L18-L35)
	- [OddEven.reveal(uint256,bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L37-L56)
	- [OddEven.stage](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L17)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74


## unchecked-lowlevel
Impact: Medium
Confidence: Medium
 - [ ] ID-1
[OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74) ignores return value by [players[n % 2].addr.call.value(3000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L66)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74


 - [ ] ID-2
[OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74) ignores return value by [players[(n + 1) % 2].addr.call.value(1000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L69)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74


## uninitialized-local
Impact: Medium
Confidence: Medium
 - [ ] ID-3
[OddEven.play(bytes32).playerIndex](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L20) is a local variable never initialized

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L20


 - [ ] ID-4
[OddEven.reveal(uint256,bytes32).playerIndex](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L42) is a local variable never initialized

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L42


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-5
Version constraint ^0.5.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- DirtyBytesArrayToStorage
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching
	- EmptyByteArrayCopy
	- DynamicArrayCleanup
	- ImplicitConstructorCallvalueCheck
	- TupleAssignmentMultiStackSlotComponents
	- MemoryArrayCreationOverflow
	- privateCanBeOverridden
	- SignedArrayStorageCopy
	- ABIEncoderV2StorageArrayWithMultiSlotElement
	- DynamicConstructorArgumentsClippedABIV2
	- UninitializedFunctionPointerInConstructor
	- IncorrectEventSignatureInLibraries
	- ABIEncoderV2PackedStorage.
It is used by:
	- [^0.5.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L1


 - [ ] ID-6
solc-0.5.0 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-7
Low level call in [OddEven.distribute()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74):
	- [players[n % 2].addr.call.value(3000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L66)
	- [players[(n + 1) % 2].addr.call.value(1000000000000000000)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L69)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Fixed/7-2-1a_Fixed.sol#L58-L74


