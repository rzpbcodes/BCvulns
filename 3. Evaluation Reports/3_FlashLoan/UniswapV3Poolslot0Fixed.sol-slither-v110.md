**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unused-return](#unused-return) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[UniswapV3Poolslot0Fixed.getTWAPPrice()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0Fixed/UniswapV3Poolslot0Fixed.sol#L26-L38) ignores return value by [(tickCumulatives,None) = uniswapPool.observe(timePoints)](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0Fixed/UniswapV3Poolslot0Fixed.sol#L31)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0Fixed/UniswapV3Poolslot0Fixed.sol#L26-L38


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0Fixed/UniswapV3Poolslot0Fixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0Fixed/UniswapV3Poolslot0Fixed.sol#L2


