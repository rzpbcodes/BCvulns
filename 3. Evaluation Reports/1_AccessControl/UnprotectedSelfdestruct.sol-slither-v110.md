**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [suicidal](#suicidal) (1 results) (High)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## suicidal
Impact: High
Confidence: High
 - [ ] ID-0
[UnprotectedSelfdestruct.cancelContract()](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L34-L36) allows anyone to destruct the contract

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L34-L36


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[UnprotectedSelfdestruct._owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L7) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol#L7


