**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [events-access](#events-access) (1 results) (Low)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
## events-access
Impact: Low
Confidence: Medium
 - [ ] ID-0
[MissingZeroCheck.changeOwnerTo(address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L12-L14) should emit an event for: 
	- [owner = newOwner](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L13) 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L12-L14


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-1
[MissingZeroCheck.changeOwnerTo(address).newOwner](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L12) lacks a zero-check on :
		- [owner = newOwner](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L13)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L12


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidation/MissingZeroAddressValidation.sol#L2


