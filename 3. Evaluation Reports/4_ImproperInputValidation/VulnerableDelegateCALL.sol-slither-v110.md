**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [controlled-delegatecall](#controlled-delegatecall) (1 results) (High)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [unused-state](#unused-state) (1 results) (Informational)
 - [constable-states](#constable-states) (1 results) (Optimization)
## controlled-delegatecall
Impact: High
Confidence: Medium
 - [ ] ID-0
[VulnerableDelegeateCALL.forwardToWorker(address,bytes)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10-L17) uses delegatecall to a input-controlled function id
	- [(success,None) = workerAddress.delegatecall(callData)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L14)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10-L17


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-1
[VulnerableDelegeateCALL.forwardToWorker(address,bytes).workerAddress](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10) lacks a zero-check on :
		- [(success,None) = workerAddress.delegatecall(callData)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L14)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-3
Low level call in [VulnerableDelegeateCALL.forwardToWorker(address,bytes)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10-L17):
	- [(success,None) = workerAddress.delegatecall(callData)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L14)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L10-L17


## unused-state
Impact: Informational
Confidence: High
 - [ ] ID-4
[VulnerableDelegeateCALL.vulnerableStorage](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L8) is never used in [VulnerableDelegeateCALL](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L7-L26)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L8


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-5
[VulnerableDelegeateCALL.vulnerableStorage](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L8) should be constant 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol#L8


