**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [solc-version](#solc-version) (1 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-0
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L2


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-1
Reentrancy in [ReentrancySimple.withdraw()](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L11-L17):
	External calls:
	- [address(msg.sender).transfer(addrBal)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L14)
	State variables written after the call(s):
	- [balance[msg.sender] = 0](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L15)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol#L11-L17


