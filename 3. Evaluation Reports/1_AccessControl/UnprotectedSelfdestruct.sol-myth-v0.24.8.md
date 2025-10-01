## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol
### Unprotected Selfdestruct
- SWC ID: 106 in Contract `UnprotectedSelfdestruct`
- Function name: `cancelContract()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol:35
```
selfdestruct(payable(msg.sender))
```
### Transaction Order Dependence
- SWC ID: 114 in Contract `UnprotectedSelfdestruct`
- Function name: `getSalary()`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol:31
```
payable(msg.sender).transfer(_employees[msg.sender])
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol

## Unprotected Selfdestruct
- SWC ID: 106
- Severity: High
- Contract: UnprotectedSelfdestruct
- Function name: `cancelContract()`
- PC address: 155
- Estimated Gas Usage: 121 - 216

#### Description

Any sender can cause the contract to self-destruct.
Any sender can trigger execution of the SELFDESTRUCT instruction to destroy this contract account and withdraw its balance to an arbitrary address. Review the transaction trace generated for this issue and make sure that appropriate security controls are in place to prevent unrestricted access.
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol:35

#### Code

```
selfdestruct(payable(msg.sender))
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: cancelContract(), txdata: 0x2b68bb2d, value: 0x0


## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: UnprotectedSelfdestruct
- Function name: `getSalary()`
- PC address: 677
- Estimated Gas Usage: 7876 - 62727

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6C_UnprotectedSelfdestruct/UnprotectedSelfdestruct/UnprotectedSelfdestruct.sol:31

#### Code

```
payable(msg.sender).transfer(_employees[msg.sender])
```

#### Initial State:

Account: [CREATOR], balance: 0x167ffbefeff0fe000, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: sendSalary(address), txdata: 0x3c9266e0000000000000000000000000deadbeefdeadbeefdeadbeefdeadbeefdeadbeef, decoded_data: ('0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef',), value: 0x1
Caller: [ATTACKER], function: getSalary(), txdata: 0x58b08d2e, value: 0x0


