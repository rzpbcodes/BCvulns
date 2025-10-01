## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestructFixed/UnprotectedSelfdestructFixed.sol
### Transaction Order Dependence
- SWC ID: 114 in Contract `UnprotectedSelfdestructFixed`
- Function name: `getSalary()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestructFixed/UnprotectedSelfdestructFixed.sol:31
```
payable(msg.sender).transfer(_employees[msg.sender])
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestructFixed/UnprotectedSelfdestructFixed.sol

## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: UnprotectedSelfdestructFixed
- Function name: `getSalary()`
- PC address: 821
- Estimated Gas Usage: 7876 - 62727

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestructFixed/UnprotectedSelfdestructFixed.sol:31

#### Code

```
payable(msg.sender).transfer(_employees[msg.sender])
```

#### Initial State:

Account: [CREATOR], balance: 0x44a005444444e6460, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: sendSalary(address), txdata: 0x3c9266e0000000000000000000000000deadbeefdeadbeefdeadbeefdeadbeefdeadbeef, decoded_data: ('0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef',), value: 0x1
Caller: [ATTACKER], function: getSalary(), txdata: 0x58b08d2e, value: 0x0


