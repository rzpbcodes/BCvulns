**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-0
[PossibleDivisionByZeroFixed.distributeToRecipients()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L32-L44) has external calls inside a loop: [_recipients[index].send(share)](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L40)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L32-L44


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L2


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-2
Reentrancy in [PossibleDivisionByZeroFixed.distributeToRecipients()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L32-L44):
	External calls:
	- [_recipients[index].send(share)](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L40)
	State variables written after the call(s):
	- [_rewardCollected[_recipients[index]] = true](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L41)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L32-L44


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-3
[PossibleDivisionByZeroFixed.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L10) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroFixed/PossibleDivisionByZeroFixed.sol#L10


