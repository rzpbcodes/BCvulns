**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
Reentrancy in [SimpleDAO.withdraw(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L10-L15):
	External calls:
	- [require(bool)(msg.sender.call.value(amount)())](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L12)
	State variables written after the call(s):
	- [credit[msg.sender] -= amount](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L13)
	[SimpleDAO.credit](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L4) can be used in cross function reentrancies:
	- [SimpleDAO.credit](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L4)
	- [SimpleDAO.donate(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L6-L8)
	- [SimpleDAO.queryCredit(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L17-L19)
	- [SimpleDAO.withdraw(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L10-L15)

../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L10-L15


## solc-version
Impact: Informational
Confidence: High
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
	- [0.4.24](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L1


 - [ ] ID-2
solc-0.4.24 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-3
Low level call in [SimpleDAO.withdraw(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L10-L15):
	- [require(bool)(msg.sender.call.value(amount)())](../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L12)

../../contracts/3.OpenSCV/openscv-subfolders-slither/1-1-1a_Bug/1-1-1a_Bug.sol#L10-L15


