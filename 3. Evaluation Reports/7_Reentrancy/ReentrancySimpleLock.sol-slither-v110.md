**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
Reentrancy in [ReentrancySimple.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20):
	External calls:
	- [(success,None) = address(msg.sender).call{value: addrBal}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L16)
	State variables written after the call(s):
	- [balance[msg.sender] = 0](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L17)
	[ReentrancySimple.balance](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L5) can be used in cross function reentrancies:
	- [ReentrancySimple.deposit()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L8-L10)
	- [ReentrancySimple.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20)
	- [locked = false](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L19)
	[ReentrancySimple.locked](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L6) can be used in cross function reentrancies:
	- [ReentrancySimple.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-2
Low level call in [ReentrancySimple.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20):
	- [(success,None) = address(msg.sender).call{value: addrBal}()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L16)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleLock/ReentrancySimpleLock.sol#L12-L20


