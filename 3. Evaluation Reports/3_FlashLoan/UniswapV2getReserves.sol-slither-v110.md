**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unused-return](#unused-return) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (3 results) (Optimization)
## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[UniswapV2getReserves.getUniswapPrice()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L24-L28) ignores return value by [(reserve0,reserve1,None) = uniswapPair.getReserves()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L26)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L24-L28


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[UniswapV2getReserves.tokenB](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L16) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L16


 - [ ] ID-3
[UniswapV2getReserves.uniswapPair](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L14) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L14


 - [ ] ID-4
[UniswapV2getReserves.tokenA](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L15) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReserves/UniswapV2getReserves.sol#L15


