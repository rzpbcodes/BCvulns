**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [events-access](#events-access) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
## events-access
Impact: Low
Confidence: Medium
 - [ ] ID-0
[MissingZeroCheck.changeOwnerTo(address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidationFixed/MissingZeroAddressValidationFixed.sol#L12-L15) should emit an event for: 
	- [owner = newOwner](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidationFixed/MissingZeroAddressValidationFixed.sol#L14) 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidationFixed/MissingZeroAddressValidationFixed.sol#L12-L15


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidationFixed/MissingZeroAddressValidationFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/3A_ValueNotChecked/MissingZeroAddressValidationFixed/MissingZeroAddressValidationFixed.sol#L2


