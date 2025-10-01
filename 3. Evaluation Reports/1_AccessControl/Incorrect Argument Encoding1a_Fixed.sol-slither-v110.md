**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [incorrect-exp](#incorrect-exp) (1 results) (High)
 - [divide-before-multiply](#divide-before-multiply) (8 results) (Medium)
 - [assembly](#assembly) (5 results) (Informational)
 - [solc-version](#solc-version) (1 results) (Informational)
## incorrect-exp
Impact: High
Confidence: Medium
 - [ ] ID-0
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) has bitwise-xor operator ^ instead of the exponentiation operator **: 
	 - [inverse = (3 * denominator) ^ 2](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L146)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


## divide-before-multiply
Impact: Medium
Confidence: Medium
 - [ ] ID-1
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L152)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-2
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L150)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-3
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L155)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-4
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L154)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-5
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [prod0 = prod0 / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L134)
	- [result = prod0 * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L161)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-6
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L151)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-7
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse *= 2 - denominator * inverse](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L153)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-8
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L131)
	- [inverse = (3 * denominator) ^ 2](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L146)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-9
[Math.mulDiv(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L92-L96)
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L115-L122)
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L129-L138)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L85-L164


 - [ ] ID-10
[ECDSA.toEthSignedMessageHash(bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L596-L605) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L600-L604)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L596-L605


 - [ ] ID-11
[ECDSA.toTypedDataHash(bytes32,bytes32)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L628-L637) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L630-L636)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L628-L637


 - [ ] ID-12
[ECDSA.tryRecover(bytes32,bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L486-L503) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L494-L498)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L486-L503


 - [ ] ID-13
[Strings.toString(uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L377-L397) uses assembly
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L383-L385)
	- [INLINE ASM](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L389-L391)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L377-L397


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-14
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
	- [^0.8.0](../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L1)

../../contracts/3.OpenSCV/openscv-subfolders-slither/7-3-41a_Fixed/7-3-41a_Fixed.sol#L1


