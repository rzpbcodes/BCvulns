**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-eth](#arbitrary-send-eth) (1 results) (High)
 - [solc-version](#solc-version) (1 results) (Informational)
## arbitrary-send-eth
Impact: High
Confidence: Medium
 - [ ] ID-0
[CrossChainBridge.withdraw(address,uint256)](../../contracts/vulns-in-bc/5_LogicalError/crossChain/crossChain.sol#L11-L17) sends eth to arbitrary user
	Dangerous calls:
	- [address(recipient).transfer(amount)](../../contracts/vulns-in-bc/5_LogicalError/crossChain/crossChain.sol#L16)

../../contracts/vulns-in-bc/5_LogicalError/crossChain/crossChain.sol#L11-L17


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
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
	- [^0.8.0](../../contracts/vulns-in-bc/5_LogicalError/crossChain/crossChain.sol#L1)

../../contracts/vulns-in-bc/5_LogicalError/crossChain/crossChain.sol#L1


