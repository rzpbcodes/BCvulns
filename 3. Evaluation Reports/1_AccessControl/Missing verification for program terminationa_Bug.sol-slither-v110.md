**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [suicidal](#suicidal) (1 results) (High)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [naming-convention](#naming-convention) (1 results) (Informational)
## suicidal
Impact: High
Confidence: High
 - [ ] ID-0
[xyz.destroy()](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L12-L14) allows anyone to destruct the contract

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L12-L14


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
solc-0.5.0 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-2
Version constraint 0.5.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
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
	- [0.5.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L1


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-3
Contract [xyz](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L3-L15) is not in CapWords

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Bug/7-1-3a_Bug.sol#L3-L15


