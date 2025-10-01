**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [controlled-delegatecall](#controlled-delegatecall) (1 results) (High)
 - [dead-code](#dead-code) (1 results) (Informational)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## controlled-delegatecall
Impact: High
Confidence: Medium
 - [ ] ID-0
[VulnerableDelegeateCALLFixed.forwardToWorker(address,bytes)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L30-L41) uses delegatecall to a input-controlled function id
	- [(success,None) = workerAddress.delegatecall(callData)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L38)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L30-L41


## dead-code
Impact: Informational
Confidence: Medium
 - [ ] ID-1
[VulnerableDelegeateCALLFixed.executePreCallLogic()](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L43-L45) is never used and should be removed

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L43-L45


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-3
Low level call in [VulnerableDelegeateCALLFixed.forwardToWorker(address,bytes)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L30-L41):
	- [(success,None) = workerAddress.delegatecall(callData)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L38)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L30-L41


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-4
[VulnerableDelegeateCALLFixed.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L8) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALLFixed/VulnerableDelegateCALLFixed.sol#L8


