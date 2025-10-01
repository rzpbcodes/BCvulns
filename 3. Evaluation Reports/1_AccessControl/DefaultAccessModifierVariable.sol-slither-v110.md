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
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-1
[DefaultAccessModifierVariable.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L7) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L7


 - [ ] ID-2
[DefaultAccessModifierVariable.fee](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L10) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6B_DefaultAccessModifier/DefaultAccessModifierVariable/DefaultAccessModifierVariable.sol#L10


