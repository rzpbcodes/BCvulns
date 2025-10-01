**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unused-return](#unused-return) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[UniswapV3Poolslot0.getUniswapPrice()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L26-L29) ignores return value by [(sqrtPriceX96,None,None,None,None,None,None) = uniswapPool.slot0()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L27)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L26-L29


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[UniswapV3Poolslot0.uniswapPool](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L20) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV3Poolslot0/UniswapV3Poolslot0.sol#L20


