## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol
### External Call To User-Supplied Address
- SWC ID: 107 in Contract `ReentrancySimple`
- Function name: `withdraw()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:14
```
payable(msg.sender).call{gas: gasLimit, value: addrBal}("")
```
### Transaction Order Dependence
- SWC ID: 114 in Contract `ReentrancySimple`
- Function name: `withdraw()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:14
```
payable(msg.sender).call{gas: gasLimit, value: addrBal}("")
```
### State access after external call
- SWC ID: 107 in Contract `ReentrancySimple`
- Function name: `withdraw()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:15
```
balance[msg.sender] = 0
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol

## External Call To User-Supplied Address
- SWC ID: 107
- Severity: Low
- Contract: ReentrancySimple
- Function name: `withdraw()`
- PC address: 203
- Estimated Gas Usage: 7229 - 62173

#### Description

A call to a user-supplied address is executed.
An external message call to an address specified by the caller is executed. Note that the callee account might contain arbitrary code and could re-enter any function within this contract. Reentering the contract in an intermediate state may lead to unexpected behaviour. Make sure that no state modifications are executed after this call and/or reentrancy guards are in place.
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:14

#### Code

```
payable(msg.sender).call{gas: gasLimit, value: addrBal}("")
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: ReentrancySimple
- Function name: `withdraw()`
- PC address: 203
- Estimated Gas Usage: 7229 - 62173

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:14

#### Code

```
payable(msg.sender).call{gas: gasLimit, value: addrBal}("")
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: ReentrancySimple
- Function name: `withdraw()`
- PC address: 328
- Estimated Gas Usage: 7229 - 62173

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCall/ReentrancySimpleGasLimitCall.sol:15

#### Code

```
balance[msg.sender] = 0
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


