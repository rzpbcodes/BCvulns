**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [arbitrary-send-erc20](#arbitrary-send-erc20) (1 results) (High)
 - [incorrect-equality](#incorrect-equality) (2 results) (Medium)
 - [reentrancy-no-eth](#reentrancy-no-eth) (3 results) (Medium)
 - [shadowing-local](#shadowing-local) (5 results) (Low)
 - [missing-zero-check](#missing-zero-check) (1 results) (Low)
 - [variable-scope](#variable-scope) (3 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (10 results) (Low)
 - [reentrancy-events](#reentrancy-events) (18 results) (Low)
 - [timestamp](#timestamp) (3 results) (Low)
 - [dead-code](#dead-code) (2 results) (Informational)
 - [function-init-state](#function-init-state) (1 results) (Informational)
 - [solc-version](#solc-version) (2 results) (Informational)
 - [low-level-calls](#low-level-calls) (1 results) (Informational)
 - [naming-convention](#naming-convention) (27 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
 - [external-function](#external-function) (1 results) (Optimization)
## arbitrary-send-erc20
Impact: High
Confidence: High
 - [ ] ID-0
[Accounting.depositToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195) uses arbitrary from in transferFrom: [require(bool)(ERC20(_token).transferFrom(_from,address(this),_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L191)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195


## incorrect-equality
Impact: Medium
Confidence: High
 - [ ] ID-1
[ButtonBase.active()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L375-L381) uses a dangerous strict equality:
	- [campaigns.length == 0](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L376)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L375-L381


 - [ ] ID-2
[ButtonBase.lastWinner()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L407-L417) uses a dangerous strict equality:
	- [campaigns.length == 0](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L408)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L407-L417


## reentrancy-no-eth
Impact: Medium
Confidence: Medium
 - [ ] ID-3
Reentrancy in [DSAuth.setAuthority(DSAuthority)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L36-L42):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L38)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [authority = authority_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L40)
	[DSAuth.authority](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L20) can be used in cross function reentrancies:
	- [DSAuth.authority](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L20)
	- [DSAuth.isAuthorized(address,bytes4)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L49-L59)
	- [DSAuth.setAuthority(DSAuthority)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L36-L42)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L36-L42


 - [ ] ID-4
Reentrancy in [ButtonBase.redeemSurplusERC20(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637):
	External calls:
	- [realTokenBalance = ERC20(token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L633)
	- [balanceToken(base,token,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L635)
		- [balance = ERC20(_token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L262)
	- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L636)
		- [require(bool)(ERC20(_token).transfer(_to,_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L234)
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L636)
		- [_in = true](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L147)
		- [_in = false](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L149)
	[Accounting._in](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L143) can be used in cross function reentrancies:
	- [Accounting.noReentrance()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L145-L150)
	- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L636)
		- [totalTokenBalances[_token] = totalTokenBalances[_token].sub(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L232)
	[Accounting.totalTokenBalances](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L154) can be used in cross function reentrancies:
	- [Accounting.balanceToken(Accounting.Account,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261-L267)
	- [ButtonBase.redeemSurplusERC20(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637)
	- [Accounting.sendToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225-L236)
	- [Accounting.totalTokenBalances](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L154)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637


 - [ ] ID-5
Reentrancy in [DSAuth.setOwner(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28-L34):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L30)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [owner = owner_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L32)
	[DSAuth.owner](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L21) can be used in cross function reentrancies:
	- [DSAuth.DSAuth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L23-L26)
	- [DSAuth.isAuthorized(address,bytes4)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L49-L59)
	- [DSAuth.owner](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L21)
	- [DSAuth.setOwner(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28-L34)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28-L34


## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-6
[ButtonBase.latestData().lastPresser](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385) shadows:
	- [ButtonBase.lastPresser()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L513-L515) (function)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385


 - [ ] ID-7
[ButtonBase.latestData().jackpot](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385) shadows:
	- [ButtonBase.jackpot()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L523-L534) (function)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385


 - [ ] ID-8
[ButtonBase.latestData().price](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385) shadows:
	- [ButtonBase.price()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L427-L433) (function)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385


 - [ ] ID-9
[ButtonBase.latestData().presses](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385) shadows:
	- [ButtonBase.presses()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L504-L510) (function)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385


 - [ ] ID-10
[ButtonBase.latestData().deadline](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385) shadows:
	- [ButtonBase.deadline()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L499-L501) (function)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L385


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-11
[DSAuth.setOwner(address).owner_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28) lacks a zero-check on :
		- [owner = owner_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L32)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28


## variable-scope
Impact: Low
Confidence: High
 - [ ] ID-12
Variable '[TheButton.start().c](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729)' in [TheButton.start()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736) potentially used before declaration: [_press(c)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L734)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729


 - [ ] ID-13
Variable '[TheButton.start().c](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729)' in [TheButton.start()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736) potentially used before declaration: [c = campaigns[lastCampaignID]](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L733)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729


 - [ ] ID-14
Variable '[TheButton.start().c](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729)' in [TheButton.start()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736) potentially used before declaration: [depositETH(c.total,msg.sender,msg.value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L735)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L729


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-15
Reentrancy in [ButtonBase.setCharityBeneficiary(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681-L688):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L682)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [timeLimited(7862400)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L683)
		- [_lastExecuted[msg.sig] = now](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L330)
	- [charityBeneficiary = _charity](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L686)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681-L688


 - [ ] ID-16
Reentrancy in [ButtonBase.redeemSurplusETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [balanceETH(base,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L627)
		- [totalETH = totalETH.add(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L184)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629


 - [ ] ID-17
Reentrancy in [ButtonBase.withdrawBaseETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640-L642):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L641)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	State variables written after the call(s):
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L641)
		- [_in = true](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L147)
		- [_in = false](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L149)
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L641)
		- [totalETH = totalETH.sub(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L204)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640-L642


 - [ ] ID-18
Reentrancy in [Accounting.depositToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195):
	External calls:
	- [require(bool)(ERC20(_token).transferFrom(_from,address(this),_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L191)
	State variables written after the call(s):
	- [totalTokenBalances[_token] = totalTokenBalances[_token].add(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L192)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195


 - [ ] ID-19
Reentrancy in [ButtonBase.withdrawRevenue()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611-L613):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(revenue,owner,revenue.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L612)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	State variables written after the call(s):
	- [sendETH(revenue,owner,revenue.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L612)
		- [_in = true](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L147)
		- [_in = false](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L149)
	- [sendETH(revenue,owner,revenue.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L612)
		- [totalETH = totalETH.sub(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L204)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611-L613


 - [ ] ID-20
Reentrancy in [TheButton.start()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [_newCampaign()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L732)
		- [_campaignID = campaigns.length ++](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L777)
		- [c.price = startingPrice](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L781)
		- [c.priceMultiplier = _priceMultiplier](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L782)
		- [c.devFraction = _devFraction](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L783)
		- [c.charityFraction = _charityFraction](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L784)
		- [c.jackpotFraction = _jackpotFraction](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L785)
		- [c.newCampaignFraction = _newCampaignFraction](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L786)
		- [c.deadline = uint64(now.add(_period))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L787)
		- [c.n = _n](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L788)
		- [c.period = _period](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L789)
		- [c.total.name = keccak256()(abi.encodePacked(Total,lastCampaignID))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L790)
	- [_newCampaign()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L732)
		- [lastCampaignID = _campaignID](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L779)
	- [stopped = false](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L726)
	- [depositETH(c.total,msg.sender,msg.value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L735)
		- [totalETH = totalETH.add(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L184)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736


 - [ ] ID-21
Reentrancy in [TheButton.stop()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L739-L742):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L739)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [stopped = true](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L741)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L739-L742


 - [ ] ID-22
Reentrancy in [ButtonBase.redeemSurplusETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L628)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	State variables written after the call(s):
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L628)
		- [_in = true](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L147)
		- [_in = false](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L149)
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L628)
		- [totalETH = totalETH.sub(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L204)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629


 - [ ] ID-23
Reentrancy in [ButtonBase.setButtonParams(uint256,uint256,uint32,uint32)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L652-L663):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L653)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [_n = n_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L661)
	- [_period = period_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L660)
	- [_priceMultiplier = priceMul_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L659)
	- [startingPrice = startingPrice_](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L658)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L652-L663


 - [ ] ID-24
Reentrancy in [ButtonBase.setAccountingParams(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666-L678):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L667)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	State variables written after the call(s):
	- [_charityFraction = _charityF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L674)
	- [_devFraction = _devF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L673)
	- [_jackpotFraction = ONE_WAD.sub(_devF).sub(_charityF).sub(_newCampF)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L676)
	- [timeLimited(1209600)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L669)
		- [_lastExecuted[msg.sig] = now](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L330)
	- [_newCampaignFraction = _newCampF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L675)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666-L678


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-25
Reentrancy in [Accounting.sendToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225-L236):
	External calls:
	- [require(bool)(ERC20(_token).transfer(_to,_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L234)
	Event emitted after the call(s):
	- [TokenSent(a.name,_token,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L235)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225-L236


 - [ ] ID-26
Reentrancy in [Accounting.depositToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195):
	External calls:
	- [require(bool)(ERC20(_token).transferFrom(_from,address(this),_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L191)
	Event emitted after the call(s):
	- [TokenDeposited(a.name,_token,_from,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L194)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195


 - [ ] ID-27
Reentrancy in [Accounting.transact(Accounting.Account,address,uint256,bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211-L223):
	External calls:
	- [require(bool)(_to.call.value(_value)(data))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L220)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L222)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211-L223


 - [ ] ID-28
Reentrancy in [TheButton.start()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [ETHDeposited(a.name,_from,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L185)
		- [depositETH(c.total,msg.sender,msg.value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L735)
	- [ETHTransferred(_from.name,_to.name,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L244)
		- [_newCampaign()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L732)
	- [Pressed(msg.sender,msg.value,c.deadline - uint64(now))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L768)
		- [_press(c)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L734)
	- [Started(c.total.balanceETH,_period,lastCampaignID)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L792)
		- [_newCampaign()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L732)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L724-L736


 - [ ] ID-29
Reentrancy in [DSAuth.setOwner(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28-L34):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L30)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [LogSetOwner(owner)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L33)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L28-L34


 - [ ] ID-30
Reentrancy in [ButtonBase.withdrawBaseERC20(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L645-L647):
	External calls:
	- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L646)
		- [require(bool)(ERC20(_token).transfer(_to,_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L234)
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L645)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [TokenSent(a.name,_token,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L235)
		- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L646)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L645-L647


 - [ ] ID-31
Reentrancy in [ButtonBase.redeemSurplusETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L628)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L208)
		- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L628)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629


 - [ ] ID-32
Reentrancy in [ButtonBase.redeemSurplusETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [ETHDeposited(a.name,_from,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L185)
		- [balanceETH(base,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L627)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L625-L629


 - [ ] ID-33
Reentrancy in [ButtonBase.setButtonParams(uint256,uint256,uint32,uint32)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L652-L663):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L653)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [ButtonParamsChanged(startingPrice_,n_,period_,priceMul_)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L662)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L652-L663


 - [ ] ID-34
Reentrancy in [ButtonBase.setAccountingParams(uint256,uint256,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666-L678):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L667)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [AccountingParamsChanged(_devF,_charityF,_jackpotFraction)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L677)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666-L678


 - [ ] ID-35
Reentrancy in [ButtonBase.redeemSurplusERC20(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637):
	External calls:
	- [realTokenBalance = ERC20(token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L633)
	- [balanceToken(base,token,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L635)
		- [balance = ERC20(_token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L262)
	- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L636)
		- [require(bool)(ERC20(_token).transfer(_to,_value))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L234)
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [TokenSent(a.name,_token,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L235)
		- [sendToken(base,token,msg.sender,base.tokenBalances[token])](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L636)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637


 - [ ] ID-36
Reentrancy in [ButtonBase.withdrawBaseETH()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640-L642):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L641)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L208)
		- [sendETH(base,msg.sender,base.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L641)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L640-L642


 - [ ] ID-37
Reentrancy in [ButtonBase.redeemSurplusERC20(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637):
	External calls:
	- [realTokenBalance = ERC20(token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L633)
	- [balanceToken(base,token,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L635)
		- [balance = ERC20(_token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L262)
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [TokenDeposited(toAccount.name,_token,address(this),_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L266)
		- [balanceToken(base,token,surplus)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L635)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L632-L637


 - [ ] ID-38
Reentrancy in [ButtonBase.setCharityBeneficiary(address)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681-L688):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L682)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [CharityChanged(_charity)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L687)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681-L688


 - [ ] ID-39
Reentrancy in [DSAuth.setAuthority(DSAuthority)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L36-L42):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L38)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	Event emitted after the call(s):
	- [LogSetAuthority(authority)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L41)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L36-L42


 - [ ] ID-40
Reentrancy in [Accounting.balanceToken(Accounting.Account,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261-L267):
	External calls:
	- [balance = ERC20(_token).balanceOf(this)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L262)
	Event emitted after the call(s):
	- [TokenDeposited(toAccount.name,_token,address(this),_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L266)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261-L267


 - [ ] ID-41
Reentrancy in [ButtonBase.sendCharityETH(bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L619-L622):
	External calls:
	- [transact(charity,charityBeneficiary,charity.balanceETH,callData)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L621)
		- [require(bool)(_to.call.value(_value)(data))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L220)
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L619)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [transact(charity,charityBeneficiary,charity.balanceETH,callData)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L621)
		- [require(bool)(_to.call.value(_value)(data))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L220)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L222)
		- [transact(charity,charityBeneficiary,charity.balanceETH,callData)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L621)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L619-L622


 - [ ] ID-42
Reentrancy in [ButtonBase.withdrawRevenue()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611-L613):
	External calls:
	- [auth()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611)
		- [authority.canCall(src,this,sig)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L57)
	External calls sending eth:
	- [sendETH(revenue,owner,revenue.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L612)
		- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L208)
		- [sendETH(revenue,owner,revenue.balanceETH)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L612)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L611-L613


## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-43
[TheButton._finalizeCampaign(ButtonBase.ButtonCampaign)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L796-L829) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(c.deadline < now,Before deadline!)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L797)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L796-L829


 - [ ] ID-44
[ButtonBase.active()](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L375-L381) uses timestamp for comparisons
	Dangerous comparisons:
	- [campaigns[lastCampaignID].deadline >= now](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L379)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L375-L381


 - [ ] ID-45
[TheButton._press(ButtonBase.ButtonCampaign)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L758-L770) uses timestamp for comparisons
	Dangerous comparisons:
	- [require(bool,string)(c.deadline >= now,After deadline!)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L759)
	- [require(bool,string)(msg.value >= c.price,Not enough value!)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L760)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L758-L770


## dead-code
Impact: Informational
Confidence: Medium
 - [ ] ID-46
[Accounting.depositToken(Accounting.Account,address,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195) is never used and should be removed

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188-L195


 - [ ] ID-47
[Accounting.transferToken(Accounting.Account,Accounting.Account,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247-L254) is never used and should be removed

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247-L254


## function-init-state
Impact: Informational
Confidence: High
 - [ ] ID-48
[ButtonBase._devFraction](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L292) is set pre-construction with a non-constant function or state variable:
	- 10 * ONE_PERCENT_WAD - _newCampaignFraction

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L292


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-49
solc-0.4.24 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.

 - [ ] ID-50
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
	- [^0.4.24](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L5)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L5


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-51
Low level call in [Accounting.transact(Accounting.Account,address,uint256,bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211-L223):
	- [require(bool)(_to.call.value(_value)(data))](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L220)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211-L223


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-52
Parameter [Accounting.depositETH(Accounting.Account,address,uint256)._from](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L182) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L182


 - [ ] ID-53
Parameter [Accounting.transact(Accounting.Account,address,uint256,bytes)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211


 - [ ] ID-54
Parameter [Accounting.sendToken(Accounting.Account,address,address,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225


 - [ ] ID-55
Parameter [Accounting.sendToken(Accounting.Account,address,address,uint256)._token](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225


 - [ ] ID-56
Parameter [ButtonBase.setAccountingParams(uint256,uint256,uint256)._devF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666


 - [ ] ID-57
Parameter [ButtonBase.setCharityBeneficiary(address)._charity](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L681


 - [ ] ID-58
Parameter [Accounting.balanceToken(Accounting.Account,address,uint256)._token](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261


 - [ ] ID-59
Parameter [Accounting.transact(Accounting.Account,address,uint256,bytes)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L211


 - [ ] ID-60
Parameter [Accounting.transferETH(Accounting.Account,Accounting.Account,uint256)._from](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238


 - [ ] ID-61
Parameter [ButtonBase.setAccountingParams(uint256,uint256,uint256)._charityF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666


 - [ ] ID-62
Parameter [Accounting.transferToken(Accounting.Account,Accounting.Account,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247


 - [ ] ID-63
Parameter [Accounting.balanceToken(Accounting.Account,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L261


 - [ ] ID-64
Parameter [Accounting.transferToken(Accounting.Account,Accounting.Account,address,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247


 - [ ] ID-65
Parameter [Accounting.transferToken(Accounting.Account,Accounting.Account,address,uint256)._token](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247


 - [ ] ID-66
Parameter [Accounting.depositToken(Accounting.Account,address,address,uint256)._from](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188


 - [ ] ID-67
Parameter [Accounting.sendToken(Accounting.Account,address,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L225


 - [ ] ID-68
Parameter [Accounting.sendETH(Accounting.Account,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197


 - [ ] ID-69
Parameter [Accounting.transferETH(Accounting.Account,Accounting.Account,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238


 - [ ] ID-70
Parameter [ButtonBase.hasWon(address)._guy](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L592) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L592


 - [ ] ID-71
Parameter [Accounting.transferToken(Accounting.Account,Accounting.Account,address,uint256)._from](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L247


 - [ ] ID-72
Parameter [Accounting.sendETH(Accounting.Account,address,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197


 - [ ] ID-73
Parameter [Accounting.depositToken(Accounting.Account,address,address,uint256)._token](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188


 - [ ] ID-74
Parameter [ButtonBase.setAccountingParams(uint256,uint256,uint256)._newCampF](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L666


 - [ ] ID-75
Parameter [Accounting.depositToken(Accounting.Account,address,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L188


 - [ ] ID-76
Parameter [Accounting.balanceETH(Accounting.Account,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L256) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L256


 - [ ] ID-77
Parameter [Accounting.transferETH(Accounting.Account,Accounting.Account,uint256)._to](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L238


 - [ ] ID-78
Parameter [Accounting.depositETH(Accounting.Account,address,uint256)._value](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L182) is not in mixedCase

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L182


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-79
Reentrancy in [Accounting.sendETH(Accounting.Account,address,uint256)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197-L209):
	External calls:
	- [_to.transfer(_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L206)
	Event emitted after the call(s):
	- [ETHSent(a.name,_to,_value)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L208)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L197-L209


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-80
sendCharityETH(bytes) should be declared external:
	- [ButtonBase.sendCharityETH(bytes)](../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L619-L622)

../../contracts/3.OpenSCV/openscv-subfolders-slither-2/1-1-2a_Fixed/1-1-2a_Fixed.sol#L619-L622


