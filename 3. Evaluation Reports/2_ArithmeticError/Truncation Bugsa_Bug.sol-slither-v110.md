**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [locked-ether](#locked-ether) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [naming-convention](#naming-convention) (1 results) (Informational)
## locked-ether
Impact: Medium
Confidence: High
 - [ ] ID-0
Contract locking ether found:
	Contract [testTruncate](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L3-L13) has payable functions:
	 - [testTruncate.getBalance()](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L8-L10)
	But does not have a function to withdraw the ether

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L3-L13


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- DataLocationChangeInInternalOverride
	- NestedCalldataArrayAbiReencodingSizeValidation
	- SignedImmutables
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching.
It is used by:
	- [0.8.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L1


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-2
Contract [testTruncate](../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L3-L13) is not in CapWords

../../contracts/3.OpenSCV/openscv-subfolders-slither/6-3-1a_Bug/6-3-1a_Bug.sol#L3-L13


