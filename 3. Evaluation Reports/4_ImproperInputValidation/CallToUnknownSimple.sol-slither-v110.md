**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimple/CallToUnknownSimple.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimple/CallToUnknownSimple.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-1
Low level call in [CallToUnknownSimple.foo(string,address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimple/CallToUnknownSimple.sol#L8-L18):
	- [(success,processed) = provider.call(abi.encodeWithSignature(process(string),data))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimple/CallToUnknownSimple.sol#L13-L15)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownSimple/CallToUnknownSimple.sol#L8-L18


