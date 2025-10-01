**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unused-return](#unused-return) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[Price.fetchCurrentPrice()](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L15-L19) ignores return value by [(None,currentPrice,None,None,None) = priceSource.latestRoundData()](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L17)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L15-L19


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L2)

../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[Price.priceSource](../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L9) should be immutable 

../../contracts/vulns-in-bc/6_OraclePriceManipulation/Price/Price.sol#L9


