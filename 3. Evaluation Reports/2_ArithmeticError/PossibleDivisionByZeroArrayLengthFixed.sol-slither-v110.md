**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [calls-loop](#calls-loop) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## calls-loop
Impact: Low
Confidence: Medium
 - [ ] ID-0
[PossibleDivisionByZeroArrayLengthFixed.split(address[])](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L6-L19) has external calls inside a loop: [(success,None) = address(recipients[index]).call{value: bounty}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L14-L16)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L6-L19


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-2
Low level call in [PossibleDivisionByZeroArrayLengthFixed.split(address[])](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L6-L19):
	- [(success,None) = address(recipients[index]).call{value: bounty}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L14-L16)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroArrayLengthFixed/PossibleDivisionByZeroArrayLengthFixed.sol#L6-L19


