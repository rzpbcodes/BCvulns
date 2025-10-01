## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6D_UnprotectedEtherTransfer/UnprotectedTransfer/UnprotectedTransfer.sol
### Transaction Order Dependence
- SWC ID: 114 in Contract `UnprotectedEtherTransfer`
- Function name: `withdrawSalary()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6D_UnprotectedEtherTransfer/UnprotectedTransfer/UnprotectedTransfer.sol:31
```
payable(msg.sender).transfer(employees[msg.sender])
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6D_UnprotectedEtherTransfer/UnprotectedTransfer/UnprotectedTransfer.sol

## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: UnprotectedEtherTransfer
- Function name: `withdrawSalary()`
- PC address: 415
- Estimated Gas Usage: 6942 - 61603

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6D_UnprotectedEtherTransfer/UnprotectedTransfer/UnprotectedTransfer.sol:31

#### Code

```
payable(msg.sender).transfer(employees[msg.sender])
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: withdrawSalary(), txdata: 0x9005b2c4, value: 0x0


