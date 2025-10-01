**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (2 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
solc-0.4.24 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-1
Version constraint 0.4.24 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
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
	- ABIEncoderV2PackedStorage_0.4.x
	- ExpExponentCleanup
	- EventStructWrongData.
It is used by:
	- [0.4.24](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Fixed/1-1-1a_Fixed.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Fixed/1-1-1a_Fixed.sol#L1


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-2
Low level call in [SimpleDAO.withdraw(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Fixed/1-1-1a_Fixed.sol#L10-L15):
	- [require(bool)(msg.sender.call.value(amount)())](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Fixed/1-1-1a_Fixed.sol#L13)

../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Fixed/1-1-1a_Fixed.sol#L10-L15


