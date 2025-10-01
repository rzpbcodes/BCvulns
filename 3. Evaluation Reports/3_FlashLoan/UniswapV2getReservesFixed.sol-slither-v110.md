**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unused-return](#unused-return) (3 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[UniswapV2getReservesFixed.getTWAPPrice()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L48-L65) ignores return value by [(None,None,currentTimestamp) = uniswapPair.getReserves()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L51)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L48-L65


 - [ ] ID-1
[UniswapV2getReservesFixed.updateTWAP()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L35-L46) ignores return value by [(None,None,currentTimestamp) = uniswapPair.getReserves()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L38)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L35-L46


 - [ ] ID-2
[UniswapV2getReservesFixed.constructor(address)](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L24-L33) ignores return value by [(None,None,lastTimestamp) = uniswapPair.getReserves()](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L32)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L24-L33


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-3
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical-all/3_FlashLoan/UniswapV2getReservesFixed/UniswapV2getReservesFixed.sol#L2


