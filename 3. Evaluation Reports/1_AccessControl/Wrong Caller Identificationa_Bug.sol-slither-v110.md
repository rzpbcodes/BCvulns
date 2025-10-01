**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-eth](#arbitrary-send-eth) (1 results) (High)
 - [tx-origin](#tx-origin) (1 results) (Medium)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [solc-version](#solc-version) (2 results) (Informational)
## arbitrary-send-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
[MyContract.sendTo(address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11-L14) sends eth to arbitrary user
	Dangerous calls:
	- [receiver.transfer(amount)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L13)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11-L14


## tx-origin
Impact: Medium
Confidence: Medium
 - [ ] ID-1
[MyContract.sendTo(address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11-L14) uses tx.origin for authorization: [require(bool)(tx.origin == owner)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L12)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11-L14


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-2
[MyContract.sendTo(address,uint256).receiver](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11) lacks a zero-check on :
		- [receiver.transfer(amount)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L13)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L11


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-3
solc-0.4.25 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-4
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
	- [0.4.25](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-1-1a_Bug/7-1-1a_Bug.sol#L1


