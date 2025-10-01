**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [unchecked-transfer](#unchecked-transfer) (2 results) (High)
 - [reentrancy-no-eth](#reentrancy-no-eth) (1 results) (Medium)
 - [unused-return](#unused-return) (1 results) (Medium)
 - [reentrancy-events](#reentrancy-events) (1 results) (Low)
 - [solc-version](#solc-version) (1 results) (Informational)
 - [naming-convention](#naming-convention) (12 results) (Informational)
 - [constable-states](#constable-states) (1 results) (Optimization)
 - [immutable-states](#immutable-states) (7 results) (Optimization)
## unchecked-transfer
Impact: High
Confidence: Medium
 - [ ] ID-0
[DepositContract.withdraw(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L131-L140) ignores return value by [tokenContract.transfer(msg.sender,_tokensToWithdraw)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L139)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L131-L140


 - [ ] ID-1
[DepositContract.deposit(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L119-L129) ignores return value by [tokenContract.transferFrom(msg.sender,address(this),_tokensToExchange)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L127)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L119-L129


## reentrancy-no-eth
Impact: Medium
Confidence: Medium
 - [ ] ID-2
Reentrancy in [TokenContract.transferFrom(address,address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67):
	External calls:
	- [m.tokensToSend(msg.sender,_from,_to,_value,,)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L56)
	State variables written after the call(s):
	- [allowances[_from][msg.sender] -= _value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L61)
	[TokenContract.allowances](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L8) can be used in cross function reentrancies:
	- [TokenContract.allowance(address,address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L69-L75)
	- [TokenContract.allowances](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L8)
	- [TokenContract.approve(address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L35-L42)
	- [TokenContract.transferFrom(address,address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67)
	- [balanceOf[_from] -= _value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L59)
	[TokenContract.balanceOf](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L6) can be used in cross function reentrancies:
	- [TokenContract.balanceOf](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L6)
	- [TokenContract.buyToken(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L88-L99)
	- [TokenContract.transfer(address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77-L86)
	- [TokenContract.transferFrom(address,address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67)
	- [balanceOf[_to] += _value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L60)
	[TokenContract.balanceOf](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L6) can be used in cross function reentrancies:
	- [TokenContract.balanceOf](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L6)
	- [TokenContract.buyToken(uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L88-L99)
	- [TokenContract.transfer(address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77-L86)
	- [TokenContract.transferFrom(address,address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67


## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-3
[Malicious.constructor(address,address)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L160-L165) ignores return value by [token.approve(address(victim),limit * 10)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L164)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L160-L165


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-4
Reentrancy in [TokenContract.transferFrom(address,address,uint256)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67):
	External calls:
	- [m.tokensToSend(msg.sender,_from,_to,_value,,)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L56)
	Event emitted after the call(s):
	- [Transfer(_from,_to,_value)](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L65)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44-L67


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-5
Version constraint ^0.8.17 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.17](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L2)

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L2


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-6
Parameter [TokenContract.allowance(address,address)._owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L69) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L69


 - [ ] ID-7
Parameter [DepositContract.deposit(uint256)._tokensToExchange](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L119) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L119


 - [ ] ID-8
Parameter [TokenContract.transfer(address,uint256)._to](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77


 - [ ] ID-9
Parameter [TokenContract.transfer(address,uint256)._value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L77


 - [ ] ID-10
Parameter [TokenContract.allowance(address,address)._spender](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L69) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L69


 - [ ] ID-11
Parameter [Malicious.attack(uint256)._value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L175) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L175


 - [ ] ID-12
Parameter [TokenContract.transferFrom(address,address,uint256)._to](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44


 - [ ] ID-13
Parameter [DepositContract.withdraw(uint256)._tokensToWithdraw](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L131) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L131


 - [ ] ID-14
Parameter [TokenContract.approve(address,uint256)._value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L35) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L35


 - [ ] ID-15
Parameter [TokenContract.transferFrom(address,address,uint256)._value](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44


 - [ ] ID-16
Parameter [TokenContract.transferFrom(address,address,uint256)._from](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L44


 - [ ] ID-17
Parameter [TokenContract.approve(address,uint256)._spender](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L35) is not in mixedCase

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L35


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-18
[Malicious.limit](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L158) should be constant 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L158


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-19
[Malicious.victim](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L155) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L155


 - [ ] ID-20
[Malicious.attacker](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L156) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L156


 - [ ] ID-21
[DepositContract.tokenContract](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L113) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L113


 - [ ] ID-22
[TokenContract.tokenPrice](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L9) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L9


 - [ ] ID-23
[TokenContract.totalSupply](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L10) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L10


 - [ ] ID-24
[TokenContract.owner](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L12) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L12


 - [ ] ID-25
[Malicious.token](../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L154) should be immutable 

../../contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancyWithHookFixed/ReentrancyWithHookFixed.sol#L154


