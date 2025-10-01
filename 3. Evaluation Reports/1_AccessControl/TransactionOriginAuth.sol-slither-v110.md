**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-eth](#arbitrary-send-eth) (1 results) (High)
 - [tx-origin](#tx-origin) (1 results) (Medium)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## arbitrary-send-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
[TransactionStateDependency.distribute(address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L17-L21) sends eth to arbitrary user
	Dangerous calls:
	- [address(recipient).transfer(share)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L20)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L17-L21


## tx-origin
Impact: Medium
Confidence: Medium
 - [ ] ID-1
[TransactionStateDependency.distribute(address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L17-L21) uses tx.origin for authorization: [require(bool)(tx.origin == owner)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L18)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L17-L21


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-3
[TransactionStateDependency.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L6) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol#L6


