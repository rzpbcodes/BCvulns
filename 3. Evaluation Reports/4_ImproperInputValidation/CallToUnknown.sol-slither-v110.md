**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [reentrancy-benign](#reentrancy-benign) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [low-level-calls](#low-level-calls) (2 results) (Informational)
## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-0
Reentrancy in [CallToUnknown.encryptMessage(string,address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L10-L22):
	External calls:
	- [(success,encryptedText) = encryptionProvider.call(abi.encodeWithSignature(encrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L15-L17)
	State variables written after the call(s):
	- [encryptionProviders[msg.sender] = encryptionProvider](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L20)
	- [messages[msg.sender] = encryptedText](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L19)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L10-L22


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-1
Version constraint 0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-2
Low level call in [CallToUnknown.decryptMessage(string)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L24-L34):
	- [(success,decryptedText) = encryptionProviders[msg.sender].call(abi.encodeWithSignature(decrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L29-L31)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L24-L34


 - [ ] ID-3
Low level call in [CallToUnknown.encryptMessage(string,address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L10-L22):
	- [(success,encryptedText) = encryptionProvider.call(abi.encodeWithSignature(encrypt(string),message))](../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L15-L17)

../../contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1B_CallToUnknown/CallToUnknown/CallToUnknown.sol#L10-L22


