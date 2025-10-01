**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (2 results) (Informational)
 - [immutable-states](#immutable-states) (1 results) (Optimization)
## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-0
[CallToUnknownFixed.constructor(address)._encryptionProvider](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L10) lacks a zero-check on :
		- [encryptionProvider = _encryptionProvider](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L11)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L10


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-1
Reentrancy in [CallToUnknownFixed.encryptMessage(string)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L14-L25):
	External calls:
	- [(success,encryptedText) = encryptionProvider.call(abi.encodeWithSignature(encrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L19-L21)
	State variables written after the call(s):
	- [messages[msg.sender] = encryptedText](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L23)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L14-L25


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-3
Low level call in [CallToUnknownFixed.encryptMessage(string)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L14-L25):
	- [(success,encryptedText) = encryptionProvider.call(abi.encodeWithSignature(encrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L19-L21)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L14-L25


 - [ ] ID-4
Low level call in [CallToUnknownFixed.decryptMessage(string)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L27-L37):
	- [(success,decryptedText) = encryptionProvider.call(abi.encodeWithSignature(decrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L32-L34)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L27-L37


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-5
[CallToUnknownFixed.encryptionProvider](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L8) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknownFixed/CallToUnknownFixed.sol#L8


