**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [timestamp](#timestamp) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-0
[DataFixed.fetchLatestPrice()](../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L18-L32) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(block.timestamp - lastUpdated < 3600,Price data is stale)](../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L26)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L18-L32


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L2)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[DataFixed.priceFeed](../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L12) should be immutable 

../../contracts/vulns-in-bc/6_OraclePriceManipulation/DataFixed/DataFixed.sol#L12


