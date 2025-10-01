**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [constant-function-asm](#constant-function-asm) (1 results) (Medium)
 - [assembly](#assembly) (1 results) (Informational)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [naming-convention](#naming-convention) (16 results) (Informational)
 - [external-function](#external-function) (1 results) (Optimization)
## constant-function-asm
Impact: Medium
Confidence: Medium
 - [ ] ID-0
[transaction_malleablity.ecrecoverFromSig(bytes32,bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L67-L86) is declared view but contains assembly code

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L67-L86


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-1
[transaction_malleablity.ecrecoverFromSig(bytes32,bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L67-L86) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L76-L81)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L67-L86


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-2
Version constraint ^0.4.24 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- DirtyBytesArrayToStorage
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching
	- EmptyByteArrayCopy
	- DynamicArrayCleanup
	- ImplicitConstructorCallvalueCheck
	- TupleAssignmentMultiStackSlotComponents
	- MemoryArrayCreationOverflow
	- privateCanBeOverridden
	- SignedArrayStorageCopy
	- ABIEncoderV2StorageArrayWithMultiSlotElement
	- DynamicConstructorArgumentsClippedABIV2
	- UninitializedFunctionPointerInConstructor_0.4.x
	- IncorrectEventSignatureInLibraries_0.4.x
	- ABIEncoderV2PackedStorage_0.4.x
	- ExpExponentCleanup
	- EventStructWrongData.
It is used by:
	- [^0.4.24](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L1


 - [ ] ID-3
solc-0.4.24 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-4
Parameter [transaction_malleablity.recoverTransferPreSigned(bytes,address,uint256,uint256,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L37) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L37


 - [ ] ID-5
Parameter [transaction_malleablity.getTransferHash(address,uint256,uint256,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L49) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L49


 - [ ] ID-6
Parameter [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)._nonce](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L19) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L19


 - [ ] ID-7
Parameter [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)._signature](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L15) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L15


 - [ ] ID-8
Parameter [transaction_malleablity.getSignHash(bytes32)._hash](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L59) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L59


 - [ ] ID-9
Parameter [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L16) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L16


 - [ ] ID-10
Parameter [transaction_malleablity.recoverTransferPreSigned(bytes,address,uint256,uint256,uint256)._gasPrice](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L39) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L39


 - [ ] ID-11
Parameter [transaction_malleablity.recoverTransferPreSigned(bytes,address,uint256,uint256,uint256)._nonce](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L40) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L40


 - [ ] ID-12
Parameter [transaction_malleablity.recoverTransferPreSigned(bytes,address,uint256,uint256,uint256)._sig](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L36) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L36


 - [ ] ID-13
Parameter [transaction_malleablity.getTransferHash(address,uint256,uint256,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L50) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L50


 - [ ] ID-14
Parameter [transaction_malleablity.getTransferHash(address,uint256,uint256,uint256)._gasPrice](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L51) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L51


 - [ ] ID-15
Parameter [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)._gasPrice](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L18) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L18


 - [ ] ID-16
Contract [transaction_malleablity](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L3-L88) is not in CapWords

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L3-L88


 - [ ] ID-17
Parameter [transaction_malleablity.getTransferHash(address,uint256,uint256,uint256)._nonce](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L52) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L52


 - [ ] ID-18
Parameter [transaction_malleablity.recoverTransferPreSigned(bytes,address,uint256,uint256,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L38) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L38


 - [ ] ID-19
Parameter [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L17) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L17


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-20
transfer(bytes,address,uint256,uint256,uint256) should be declared external:
	- [transaction_malleablity.transfer(bytes,address,uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L14-L33)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-1a-Bug/7-3-1a-Bug.sol#L14-L33


