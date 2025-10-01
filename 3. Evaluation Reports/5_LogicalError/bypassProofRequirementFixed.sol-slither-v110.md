**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-eth](#arbitrary-send-eth) (1 results) (High)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## arbitrary-send-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
[SecureBridge.withdraw(address,uint256,bytes32,bytes32)](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L13-L34) sends eth to arbitrary user
	Dangerous calls:
	- [(success,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L32)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L13-L34


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-1
[SecureBridge.withdraw(address,uint256,bytes32,bytes32).recipient](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L14) lacks a zero-check on :
		- [(success,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L32)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L14


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
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
	- [^0.8.0](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L1)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L1


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-3
Low level call in [SecureBridge.withdraw(address,uint256,bytes32,bytes32)](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L13-L34):
	- [(success,None) = recipient.call{value: amount}()](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L32)

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L13-L34


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-4
[SecureBridge.trustedRoot](../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L6) should be immutable 

../../contracts/vulns-in-bc/5_LogicalError/bypassProofRequirementFixed/bypassProofRequirementFixed.sol#L6


