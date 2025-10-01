**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
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
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-1
[DefaultAccessModifierVariableFixed._owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L6) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L6


 - [ ] ID-2
[DefaultAccessModifierVariableFixed.fee](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L9) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariableFixed/DefaultAccessModifierVariableFixed.sol#L9


