**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [reentrancy-benign](#reentrancy-benign) (1 results) (Low)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
Reentrancy in [OddEven.selectWinner()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25):
	External calls:
	- [(success,None) = players[n % 2].addr.call.value(address(this).balance)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L21)
	State variables written after the call(s):
	- [delete players](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L23)
	[OddEven.players](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L9) can be used in cross function reentrancies:
	- [OddEven.play(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L12-L17)
	- [OddEven.selectWinner()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-1
Reentrancy in [OddEven.selectWinner()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25):
	External calls:
	- [(success,None) = players[n % 2].addr.call.value(address(this).balance)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L21)
	State variables written after the call(s):
	- [count = 0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L24)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
solc-0.5.0 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-3
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
	- [^0.5.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L1


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-4
Low level call in [OddEven.selectWinner()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25):
	- [(success,None) = players[n % 2].addr.call.value(address(this).balance)()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L21)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-2-1a_Bug/7-2-1a_Bug.sol#L19-L25


