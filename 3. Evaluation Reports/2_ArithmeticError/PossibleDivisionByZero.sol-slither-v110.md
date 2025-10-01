**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-0
[PossibleDivisionByZero.distributeTorecipients()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L32-L37) has external calls inside a loop: [_recipients[index].transfer(share)](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L35)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L32-L37


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-2
[PossibleDivisionByZero.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L10) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZero/PossibleDivisionByZero.sol#L10


