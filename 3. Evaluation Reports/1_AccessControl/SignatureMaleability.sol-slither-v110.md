**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [immutable-states](#immutable-states) (4 results) (Optimization)
## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-0
[SignatureMalleability.constructor(ECDSA,address)._admin](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L17) lacks a zero-check on :
		- [admin = _admin](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L21)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L17


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-1
Reentrancy in [SignatureMalleability.distribute(bytes)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L24-L36):
	External calls:
	- [addr = ecdsa.recover(ecdsa.toEthSignedMessageHash(keccak256(bytes)(mesg)),signature)](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L28-L31)
	State variables written after the call(s):
	- [paid[signature] = true](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L34)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L24-L36


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint >=0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [>=0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L2


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-3
[SignatureMalleability.admin](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L15) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L15


 - [ ] ID-4
[SignatureMalleability.ecdsa](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L14) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L14


 - [ ] ID-5
[SignatureMalleability.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L12) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L12


 - [ ] ID-6
[SignatureMalleability.share](../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L13) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6E_SignatureBasedVulnerability/SignatureMaleability/SignatureMaleability.sol#L13


