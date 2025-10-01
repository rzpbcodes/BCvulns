**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [timestamp](#timestamp) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-0
[PriceFixed.retrieveLatestPrice()](../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L15-L29) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp - lastUpdate < 3600,Price data is stale)](../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L23)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L15-L29


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L2)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[PriceFixed.feedSource](../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L9) should be immutable 

../../contracts/vulns-in-bc/6_OraclePriceManipulation/PriceFixed/PriceFixed.sol#L9


