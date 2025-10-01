**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-1
Low level call in [CallToUnknownSimple.foo(string)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L14-L23):
	- [(success,processed) = provider.call(abi.encodeWithSignature(process(string),data))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L18-L20)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L14-L23


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[CallToUnknownSimple.provider](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L7) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimpleFixed/CallToUnknownSimpleFixed.sol#L7


