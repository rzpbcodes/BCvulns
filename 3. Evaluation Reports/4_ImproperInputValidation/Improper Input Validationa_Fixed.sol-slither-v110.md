**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [erc20-interface](#erc20-interface) (1 results) (Medium)
 - [solc-version](#solc-version) (2 results) (Informational)
## erc20-interface
Impact: Medium
Confidence: High
 - [ ] ID-0
[NonPayloadAttackableToken](../../contracts/3.OpenSCV/openscv-subfolders-slither/5-2-1a_Fixed/5-2-1a_Fixed.sol#L3-L13) has incorrect ERC20 function interface:[NonPayloadAttackableToken.transfer(address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/5-2-1a_Fixed/5-2-1a_Fixed.sol#L9-L11)

../../contracts/3.OpenSCV/openscv-subfolders-slither/5-2-1a_Fixed/5-2-1a_Fixed.sol#L3-L13


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.4.25 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
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
	- [^0.4.25](../../contracts/3.OpenSCV/openscv-subfolders-slither/5-2-1a_Fixed/5-2-1a_Fixed.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/5-2-1a_Fixed/5-2-1a_Fixed.sol#L1


 - [ ] ID-2
solc-0.4.25 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

