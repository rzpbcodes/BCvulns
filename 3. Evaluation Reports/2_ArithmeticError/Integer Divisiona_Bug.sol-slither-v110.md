**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [shadowing-local](#shadowing-local) (1 results) (Low)
 - [solc-version](#solc-version) (2 results) (Informational)
## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-0
[Division.foo().x_scope_0](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-2-2a_Bug/6-2-2a_Bug.sol#L7) shadows:
	- [Division.foo().x](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-2-2a_Bug/6-2-2a_Bug.sol#L6) (return variable)

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-2-2a_Bug/6-2-2a_Bug.sol#L7


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
	- [0.5.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-2-2a_Bug/6-2-2a_Bug.sol#L2)

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-2-2a_Bug/6-2-2a_Bug.sol#L2


