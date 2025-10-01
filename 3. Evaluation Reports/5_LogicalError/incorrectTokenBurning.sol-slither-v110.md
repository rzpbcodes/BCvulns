**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [too-many-digits](#too-many-digits) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint ^0.8.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- DataLocationChangeInInternalOverride
	- NestedCalldataArrayAbiReencodingSizeValidation
	- SignedImmutables
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching.
It is used by:
	- [^0.8.0](../../contracts/vulns-in-bc/5_LogicalError/incorrectTokenBurning/incorrectTokenBurning.sol#L1)

../../contracts/vulns-in-bc/5_LogicalError/incorrectTokenBurning/incorrectTokenBurning.sol#L1


## too-many-digits
Impact: Informational
Confidence: Medium
 - [ ] ID-1
[TokenBurn.constructor()](../../contracts/vulns-in-bc/5_LogicalError/incorrectTokenBurning/incorrectTokenBurning.sol#L7-L9) uses literals with too many digits:
	- [totalSupply = 1000000](../../contracts/vulns-in-bc/5_LogicalError/incorrectTokenBurning/incorrectTokenBurning.sol#L8)

../../contracts/vulns-in-bc/5_LogicalError/incorrectTokenBurning/incorrectTokenBurning.sol#L7-L9


