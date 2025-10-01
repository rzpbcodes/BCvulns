**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-eth](#arbitrary-send-eth) (1 results) (High)
 - [uninitialized-state](#uninitialized-state) (1 results) (High)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [constable-states](#constable-states) (1 results) (Optimization)
## arbitrary-send-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
[VulnerableBridge.withdraw(address,uint256,bytes32,bytes32)](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L8-L25) sends eth to arbitrary user
	Dangerous calls:
	- [(pass,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L23)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L8-L25


## uninitialized-state
Impact: High
Confidence: High
 - [ ] ID-1
[VulnerableBridge.trustedRoot](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L6) is never initialized. It is used in:
	- [VulnerableBridge.withdraw(address,uint256,bytes32,bytes32)](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L8-L25)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L6


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-2
[VulnerableBridge.withdraw(address,uint256,bytes32,bytes32).recipient](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L9) lacks a zero-check on :
		- [(pass,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L23)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L9


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-3
Version constraint ^0.8.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- DataLocationChangeInInternalOverride
	- NestedCalldataArrayAbiReencodingSizeValidation
	- SignedImmutables
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching.
It is used by:
	- [^0.8.0](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L1)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L1


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-4
Low level call in [VulnerableBridge.withdraw(address,uint256,bytes32,bytes32)](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L8-L25):
	- [(pass,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L23)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L8-L25


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-5
[VulnerableBridge.trustedRoot](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L6) should be constant 

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirement/bypassProofRequirement.sol#L6


