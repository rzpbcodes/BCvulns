**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (2 results) (Informational)
 - [naming-convention](#naming-convention) (1 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint 0.4.25 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
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
	- UninitializedFunctionPointerInConstructor_0.4.x
	- IncorrectEventSignatureInLibraries_0.4.x
	- ABIEncoderV2PackedStorage_0.4.x.
It is used by:
	- [0.4.25](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L1


 - [ ] ID-1
solc-0.4.25 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-2
Contract [testSigness](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L3-L13) is not in CapWords

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L3-L13


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-3
Reentrancy in [testSigness.withdrawOnce(int256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L6-L12):
	External calls:
	- [msg.sender.transfer(uint256(amount))](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L10)
	State variables written after the call(s):
	- [transferred[msg.sender] = true](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L11)

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-2a_Bug/6-3-2a_Bug.sol#L6-L12


