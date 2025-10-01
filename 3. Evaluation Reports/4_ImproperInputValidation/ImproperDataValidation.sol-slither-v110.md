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
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L2


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-1
Reentrancy in [ImproperDataValidation.participate(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L27-L38):
	External calls:
	- [address(msg.sender).transfer(_prize)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L32)
	State variables written after the call(s):
	- [_gameEnded = true](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L33)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L27-L38


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[ImproperDataValidation._fee](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L10) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L10


 - [ ] ID-3
[ImproperDataValidation._prize](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L9) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1D_ImproperDataValidation/ImproperDataValidation/ImproperDataValidation.sol#L9


