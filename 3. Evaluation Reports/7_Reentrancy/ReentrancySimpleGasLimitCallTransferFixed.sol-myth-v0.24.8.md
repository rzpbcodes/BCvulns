## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol
### Transaction Order Dependence
- SWC ID: 114 in Contract `ReentrancySimple`
- Function name: `withdraw()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol:14
```
payable(msg.sender).transfer(addrBal)
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol

## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: ReentrancySimple
- Function name: `withdraw()`
- PC address: 194
- Estimated Gas Usage: 6933 - 61594

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/7_Reentrancy/1A_Reentrancy/ReentrancySimpleGasLimitCallTransferFixed/ReentrancySimpleGasLimitCallTransferFixed.sol:14

#### Code

```
payable(msg.sender).transfer(addrBal)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


