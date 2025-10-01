**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Data/Data.sol#L2)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/Data/Data.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-1
[Data.aggregator](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Data/Data.sol#L9) should be immutable 

../../contracts/vulns-in-bc/6_OraclePriceManipulation/Data/Data.sol#L9


