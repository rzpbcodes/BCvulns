**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [uninitialized-state](#uninitialized-state) (1 results) (High)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [constable-states](#constable-states) (1 results) (Optimization)
## uninitialized-state
Impact: High
Confidence: High
 - [ ] ID-0
[UnInitializedConditionStateVariable.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L8) is never initialized. It is used in:

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L8


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L2


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[UnInitializedConditionStateVariable.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L8) should be constant 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/UninitializedConditionStateVariable/UninitializedConditionStateVariable.sol#L8


