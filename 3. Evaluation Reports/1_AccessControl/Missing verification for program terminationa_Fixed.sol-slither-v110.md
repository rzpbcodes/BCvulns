**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (2 results) (Informational)
 - [naming-convention](#naming-convention) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
solc-0.5.0 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-1
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
	- [0.5.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Fixed/7-1-3a_Fixed.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Fixed/7-1-3a_Fixed.sol#L1


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-2
Contract [xyz](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Fixed/7-1-3a_Fixed.sol#L3-L16) is not in CapWords

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-3a_Fixed/7-1-3a_Fixed.sol#L3-L16


