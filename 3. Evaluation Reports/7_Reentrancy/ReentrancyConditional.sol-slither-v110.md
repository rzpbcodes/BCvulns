**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
Reentrancy in [ReentrancyConditional.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L11-L17):
	External calls:
	- [(success,None) = address(msg.sender).call{value: addrBal}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L13)
	State variables written after the call(s):
	- [balance[msg.sender] = 0](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L15)
	[ReentrancyConditional.balance](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L5) can be used in cross function reentrancies:
	- [ReentrancyConditional.deposit()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L7-L9)
	- [ReentrancyConditional.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L11-L17)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L11-L17


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-2
Low level call in [ReentrancyConditional.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L11-L17):
	- [(success,None) = address(msg.sender).call{value: addrBal}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L13)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyConditional/ReentrancyConditional.sol#L11-L17


