**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
 - [immutable-states](#immutable-states) (2 results) (Optimization)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L2


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-1
Reentrancy in [ImproperDataValidationFixed.participate(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L26-L39):
	External calls:
	- [address(msg.sender).transfer(_prize)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L33)
	State variables written after the call(s):
	- [_gameEnded = true](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L34)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L26-L39


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[ImproperDataValidationFixed._fee](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L9) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L9


 - [ ] ID-3
[ImproperDataValidationFixed._prize](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L8) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidationFixed/ImproperDataValidationFixed.sol#L8


