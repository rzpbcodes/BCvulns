# Report

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 1 |
| [M-2](#M-2) | `call()` should be used instead of `transfer()` on an `address payable` | 1 |
| [L-1](#L-1) | `approve()`/`safeApprove()` may revert if the current approval is not zero | 1 |
| [L-2](#L-2) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 1 |
| [L-3](#L-3) | Unsafe ERC20 operation(s) | 4 |
| [GAS-1](#GAS-1) | `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings) | 3 |
| [GAS-2](#GAS-2) | For Operations that will not overflow, you could use unchecked | 13 |
| [GAS-3](#GAS-3) | Use Custom Errors instead of Revert Strings to save Gas | 5 |
| [GAS-4](#GAS-4) | State variables only set in the constructor should be declared `immutable` | 17 |
| [GAS-5](#GAS-5) | Use != 0 instead of > 0 for unsigned integer comparison | 1 |
| [NC-1](#NC-1) | `constant`s should be defined rather than using magic numbers | 2 |
| [NC-2](#NC-2) | Control structures do not follow the Solidity Style Guide | 2 |
| [NC-3](#NC-3) | Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function | 2 |
| [NC-4](#NC-4) | Function ordering does not follow the Solidity style guide | 1 |
| [NC-5](#NC-5) | Functions should not be longer than 50 lines | 4 |
| [NC-6](#NC-6) | Change uint to uint256 | 12 |
| [NC-7](#NC-7) | `mapping` definitions do not follow the Solidity Style Guide | 3 |
| [NC-8](#NC-8) | NatSpec is completely non-existent on functions that should have them | 30 |
| [NC-9](#NC-9) | Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor | 5 |
| [NC-10](#NC-10) | Consider using named mappings | 1 |
| [NC-11](#NC-11) | Adding a `return` statement when the function defines a named return variable, is redundant | 4 |
| [NC-12](#NC-12) | `require()` / `revert()` statements should have descriptive reason strings | 5 |
| [NC-13](#NC-13) | Take advantage of Custom Error's return value property | 1 |
| [NC-14](#NC-14) | Contract does not follow the Solidity style guide's suggested layout ordering | 1 |
| [NC-15](#NC-15) | Internal and private variables and functions names should begin with an underscore | 7 |
| [NC-16](#NC-16) | Event is missing `indexed` fields | 2 |
| [NC-17](#NC-17) | `public` functions not called by the contract should be declared `external` instead | 6 |



### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

102:         onlyOwner 

```

### <a name="M-2"></a>[M-2] `call()` should be used instead of `transfer()` on an `address payable`
The use of the deprecated `transfer()` function for an address may make the transaction fail due to the 2300 gas stipend

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

105:         payable(owner).transfer(address(this).balance);

```

### <a name="L-1"></a>[L-1] `approve()`/`safeApprove()` may revert if the current approval is not zero
- Some tokens (like the *very popular* USDT) do not work when changing the allowance from an existing non-zero allowance value (it will revert if the current approval is not zero to protect against front-running changes of approvals). These tokens must first be approved for zero and then the actual allowance can be approved.
- Furthermore, OZ's implementation of safeApprove would throw an error if an approve is attempted from a non-zero value (`"SafeERC20: approve from non-zero to non-zero allowance"`)

Set the allowance to zero immediately before each of the existing allowance calls

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

164:         token.approve(address(victim), limit * 10);

```

### <a name="L-2"></a>[L-2] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

2: pragma solidity ^0.8.17;

```

### <a name="L-3"></a>[L-3] Unsafe ERC20 operation(s)

*Instances (4)*:
```solidity
File: ReentrancyWithHookFixed.sol

105:         payable(owner).transfer(address(this).balance);

127:             tokenContract.transferFrom(msg.sender, address(this), _tokensToExchange);

139:         tokenContract.transfer(msg.sender, _tokensToWithdraw);

164:         token.approve(address(victim), limit * 10);

```

### <a name="GAS-1"></a>[GAS-1] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)
This saves **16 gas per instance.**

*Instances (3)*:
```solidity
File: ReentrancyWithHookFixed.sol

60:         balanceOf[_to] += _value;

83:         balanceOf[_to] += _value;

191:         called += 1;

```

### <a name="GAS-2"></a>[GAS-2] For Operations that will not overflow, you could use unchecked

*Instances (13)*:
```solidity
File: ReentrancyWithHookFixed.sol

59:         balanceOf[_from] -= _value;

60:         balanceOf[_to] += _value;

61:         allowances[_from][msg.sender] -= _value;

82:         balanceOf[msg.sender] -= _value;

83:         balanceOf[_to] += _value;

94:         require(msg.value >= noOfTokensToBuy * tokenPrice);

96:         availableSupply -= noOfTokensToBuy;

97:         bool success = payable(msg.sender).send(msg.value - noOfTokensToBuy * tokenPrice);

126:             tokenBalance[msg.sender] = currentBal + _tokensToExchange;

138:         tokenBalance[msg.sender] -= _tokensToWithdraw;

164:         token.approve(address(victim), limit * 10);

171:         called = 1; // do not trigger withdrawal in hook

191:         called += 1;

```

### <a name="GAS-3"></a>[GAS-3] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (5)*:
```solidity
File: ReentrancyWithHookFixed.sol

50:         require(_value <= balanceOf[_from], "not enough balance");

51:         require(_value <= allowances[_from][msg.sender], "not allowed to transfer so much");

128:         } else revert("allowance is less than requested tokens");

170:         require(msg.sender == attacker, "Attacker only");

178:         require(msg.sender == attacker, "Attacker only");

```

### <a name="GAS-4"></a>[GAS-4] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (17)*:
```solidity
File: ReentrancyWithHookFixed.sol

27:         tokenPrice = _tokenPrice;

27:         tokenPrice = _tokenPrice;

27:         tokenPrice = _tokenPrice;

28:         totalSupply = _totalSupply;

28:         totalSupply = _totalSupply;

28:         totalSupply = _totalSupply;

30:         owner = msg.sender;

30:         owner = msg.sender;

30:         owner = msg.sender;

31:         symbol = _symbol;

31:         symbol = _symbol;

31:         symbol = _symbol;

116:         tokenContract = TokenContract(_tokenContract);

116:         tokenContract = TokenContract(_tokenContract);

161:         token = TokenContract(_tokenContract);

162:         victim = DepositContract(_depositContract);

163:         attacker = msg.sender;

```

### <a name="GAS-5"></a>[GAS-5] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

92:         require(noOfTokensToBuy > 0);

```

### <a name="NC-1"></a>[NC-1] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (2)*:
```solidity
File: ReentrancyWithHookFixed.sol

158:     uint private limit = 2;

164:         token.approve(address(victim), limit * 10);

```

### <a name="NC-2"></a>[NC-2] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (2)*:
```solidity
File: ReentrancyWithHookFixed.sol

98:         if (!success) revert();

192:         if(called < limit) {

```

### <a name="NC-3"></a>[NC-3] Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function

*Instances (2)*:
```solidity
File: ReentrancyWithHookFixed.sol

170:         require(msg.sender == attacker, "Attacker only");

178:         require(msg.sender == attacker, "Attacker only");

```

### <a name="NC-4"></a>[NC-4] Function ordering does not follow the Solidity style guide
According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

1: 
   Current order:
   public approve
   public transferFrom
   public allowance
   external transfer
   public buyToken
   external withdrawEth
   external deposit
   external withdraw
   external tokenBalanceOf
   public initialDeposit
   public attack
   external tokensToSend
   
   Suggested order:
   external transfer
   external withdrawEth
   external deposit
   external withdraw
   external tokenBalanceOf
   external tokensToSend
   public approve
   public transferFrom
   public allowance
   public buyToken
   public initialDeposit
   public attack

```

### <a name="NC-5"></a>[NC-5] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (4)*:
```solidity
File: ReentrancyWithHookFixed.sol

35:     function approve(address _spender, uint256 _value)

44:     function transferFrom(address _from, address _to, uint256 _value)

69:     function allowance(address _owner, address _spender)

184:     function tokensToSend(address, address, address, uint256, bytes calldata, bytes calldata) 

```

### <a name="NC-6"></a>[NC-6] Change uint to uint256
Throughout the code base, some variables are declared as `uint`. To favor explicitness, consider changing all instances of `uint` to `uint256`

*Instances (12)*:
```solidity
File: ReentrancyWithHookFixed.sol

9:     uint public tokenPrice;

10:     uint public totalSupply;

11:     uint public availableSupply;

26:     constructor (uint _tokenPrice, uint _totalSupply, string memory _symbol) {

88:     function buyToken(uint noOfTokensToBuy)

119:     function deposit(uint _tokensToExchange) 

122:         uint allowance = tokenContract.allowance(msg.sender, address(this));

124:             uint currentBal = tokenBalance[msg.sender];

131:     function withdraw(uint _tokensToWithdraw) 

157:     uint private called;

158:     uint private limit = 2;

175:     function attack(uint _value) 

```

### <a name="NC-7"></a>[NC-7] `mapping` definitions do not follow the Solidity Style Guide
See the [mappings](https://docs.soliditylang.org/en/latest/style-guide.html#mappings) section of the Solidity Style Guide

*Instances (3)*:
```solidity
File: ReentrancyWithHookFixed.sol

6:     mapping (address => uint256) public balanceOf;

8:     mapping (address => mapping(address => uint256)) public allowances;

112:     mapping (address => uint) tokenBalance;

```

### <a name="NC-8"></a>[NC-8] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (30)*:
```solidity
File: ReentrancyWithHookFixed.sol

35:     function approve(address _spender, uint256 _value)

35:     function approve(address _spender, uint256 _value)

35:     function approve(address _spender, uint256 _value)

44:     function transferFrom(address _from, address _to, uint256 _value)

44:     function transferFrom(address _from, address _to, uint256 _value)

44:     function transferFrom(address _from, address _to, uint256 _value)

77:     function transfer(address _to, uint256 _value)

77:     function transfer(address _to, uint256 _value)

77:     function transfer(address _to, uint256 _value)

88:     function buyToken(uint noOfTokensToBuy)

88:     function buyToken(uint noOfTokensToBuy)

88:     function buyToken(uint noOfTokensToBuy)

101:     function withdrawEth() 

101:     function withdrawEth() 

101:     function withdrawEth() 

119:     function deposit(uint _tokensToExchange) 

119:     function deposit(uint _tokensToExchange) 

119:     function deposit(uint _tokensToExchange) 

131:     function withdraw(uint _tokensToWithdraw) 

131:     function withdraw(uint _tokensToWithdraw) 

131:     function withdraw(uint _tokensToWithdraw) 

167:     function initialDeposit() 

167:     function initialDeposit() 

167:     function initialDeposit() 

175:     function attack(uint _value) 

175:     function attack(uint _value) 

175:     function attack(uint _value) 

184:     function tokensToSend(address, address, address, uint256, bytes calldata, bytes calldata) 

184:     function tokensToSend(address, address, address, uint256, bytes calldata, bytes calldata) 

184:     function tokensToSend(address, address, address, uint256, bytes calldata, bytes calldata) 

```

### <a name="NC-9"></a>[NC-9] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor
If a function is supposed to be access-controlled, a `modifier` should be used instead of a `require/if` statement for more readability.

*Instances (5)*:
```solidity
File: ReentrancyWithHookFixed.sol

22:         require(msg.sender == owner);

51:         require(_value <= allowances[_from][msg.sender], "not allowed to transfer so much");

81:         require(balanceOf[msg.sender] >= _value);

170:         require(msg.sender == attacker, "Attacker only");

178:         require(msg.sender == attacker, "Attacker only");

```

### <a name="NC-10"></a>[NC-10] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

8:     mapping (address => mapping(address => uint256)) public allowances;

```

### <a name="NC-11"></a>[NC-11] Adding a `return` statement when the function defines a named return variable, is redundant

*Instances (4)*:
```solidity
File: ReentrancyWithHookFixed.sol

35:     function approve(address _spender, uint256 _value)
            public
            returns (bool success)
        {
            allowances[msg.sender][_spender] = _value;
            emit Approval(msg.sender, _spender, _value);
            return true;

44:     function transferFrom(address _from, address _to, uint256 _value)
            public
            returns (bool success)
        {
            // require(_to != address(0), "");
            // require(_from != address(0));
            require(_value <= balanceOf[_from], "not enough balance");
            require(_value <= allowances[_from][msg.sender], "not allowed to transfer so much");
    
            // _callTokensToSend(msg.sender, _from, _to, _value, "", "");
            // explicit use of the malicious contract instead of _callTokensToSend
            Malicious m = Malicious(_from);
            m.tokensToSend(msg.sender, _from, _to, _value, "", "");
    
            // _move(msg.sender, _from, _to, _value, "", "");
            balanceOf[_from] -= _value;
            balanceOf[_to] += _value;
            allowances[_from][msg.sender] -= _value;
    
            // _callTokensReceived(msg.sender, _from, _to, _value, "", "", false);
    
            emit Transfer(_from, _to, _value);
            return true;

69:     function allowance(address _owner, address _spender)
            public
            view
            returns(uint256 remaining)
        {
            return allowances[_owner][_spender];

77:     function transfer(address _to, uint256 _value)
            external
            returns (bool success)
        {
            require(balanceOf[msg.sender] >= _value);
            balanceOf[msg.sender] -= _value;
            balanceOf[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;

```

### <a name="NC-12"></a>[NC-12] `require()` / `revert()` statements should have descriptive reason strings

*Instances (5)*:
```solidity
File: ReentrancyWithHookFixed.sol

22:         require(msg.sender == owner);

81:         require(balanceOf[msg.sender] >= _value);

92:         require(noOfTokensToBuy > 0);

93:         require(noOfTokensToBuy <= availableSupply);

94:         require(msg.value >= noOfTokensToBuy * tokenPrice);

```

### <a name="NC-13"></a>[NC-13] Take advantage of Custom Error's return value property
An important feature of Custom Error is that values such as address, tokenID, msg.value can be written inside the () sign, this kind of approach provides a serious advantage in debugging and examining the revert details of dapps such as tenderly.

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

98:         if (!success) revert();

```

### <a name="NC-14"></a>[NC-14] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (1)*:
```solidity
File: ReentrancyWithHookFixed.sol

1: 
   Current order:
   VariableDeclaration.balanceOf
   VariableDeclaration.symbol
   VariableDeclaration.allowances
   VariableDeclaration.tokenPrice
   VariableDeclaration.totalSupply
   VariableDeclaration.availableSupply
   VariableDeclaration.owner
   EventDefinition.Transfer
   EventDefinition.Approval
   ModifierDefinition.onlyOwner
   FunctionDefinition.constructor
   FunctionDefinition.approve
   FunctionDefinition.transferFrom
   FunctionDefinition.allowance
   FunctionDefinition.transfer
   FunctionDefinition.buyToken
   FunctionDefinition.withdrawEth
   VariableDeclaration.tokenBalance
   VariableDeclaration.tokenContract
   FunctionDefinition.constructor
   FunctionDefinition.deposit
   FunctionDefinition.withdraw
   FunctionDefinition.tokenBalanceOf
   VariableDeclaration.token
   VariableDeclaration.victim
   VariableDeclaration.attacker
   VariableDeclaration.called
   VariableDeclaration.limit
   FunctionDefinition.constructor
   FunctionDefinition.initialDeposit
   FunctionDefinition.attack
   FunctionDefinition.tokensToSend
   
   Suggested order:
   VariableDeclaration.balanceOf
   VariableDeclaration.symbol
   VariableDeclaration.allowances
   VariableDeclaration.tokenPrice
   VariableDeclaration.totalSupply
   VariableDeclaration.availableSupply
   VariableDeclaration.owner
   VariableDeclaration.tokenBalance
   VariableDeclaration.tokenContract
   VariableDeclaration.token
   VariableDeclaration.victim
   VariableDeclaration.attacker
   VariableDeclaration.called
   VariableDeclaration.limit
   EventDefinition.Transfer
   EventDefinition.Approval
   ModifierDefinition.onlyOwner
   FunctionDefinition.constructor
   FunctionDefinition.approve
   FunctionDefinition.transferFrom
   FunctionDefinition.allowance
   FunctionDefinition.transfer
   FunctionDefinition.buyToken
   FunctionDefinition.withdrawEth
   FunctionDefinition.constructor
   FunctionDefinition.deposit
   FunctionDefinition.withdraw
   FunctionDefinition.tokenBalanceOf
   FunctionDefinition.constructor
   FunctionDefinition.initialDeposit
   FunctionDefinition.attack
   FunctionDefinition.tokensToSend

```

### <a name="NC-15"></a>[NC-15] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (7)*:
```solidity
File: ReentrancyWithHookFixed.sol

12:     address private owner;

112:     mapping (address => uint) tokenBalance;

154:     TokenContract private token;

155:     DepositContract private victim;

156:     address private attacker;

157:     uint private called;

158:     uint private limit = 2;

```

### <a name="NC-16"></a>[NC-16] Event is missing `indexed` fields
Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (2)*:
```solidity
File: ReentrancyWithHookFixed.sol

14:     event Transfer(address indexed _from,

17:     event Approval(address indexed _owner,

```

### <a name="NC-17"></a>[NC-17] `public` functions not called by the contract should be declared `external` instead

*Instances (6)*:
```solidity
File: ReentrancyWithHookFixed.sol

35:     function approve(address _spender, uint256 _value)

44:     function transferFrom(address _from, address _to, uint256 _value)

69:     function allowance(address _owner, address _spender)

88:     function buyToken(uint noOfTokensToBuy)

167:     function initialDeposit() 

175:     function attack(uint _value) 

```

