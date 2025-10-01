**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [boolean-cst](#boolean-cst) (3 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
## boolean-cst
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[PossibleDivisionByZeroArrayElement.constructor()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L7-L10) uses a Boolean constant improperly:
	-[values[true] = 1](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L8)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L7-L10


 - [ ] ID-1
[PossibleDivisionByZeroArrayElement.getSomeResult(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L12-L14) uses a Boolean constant improperly:
	-[numerator / values[true]](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L13)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L12-L14


 - [ ] ID-2
[PossibleDivisionByZeroArrayElement.constructor()](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L7-L10) uses a Boolean constant improperly:
	-[values[false] = 0](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L9)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L7-L10


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-3
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/2_ArithmeticError/7B_DivideByZero/PossibleDivisionByZeroMappingElementFixed/PossibleDivisionByZeroMappingElementFixed.sol#L2


