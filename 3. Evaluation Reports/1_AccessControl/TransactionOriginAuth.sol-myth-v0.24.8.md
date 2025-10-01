## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol
### Dependence on tx.origin
- SWC ID: 115 in Contract `TransactionStateDependency`
- Function name: `distribute(address,uint256)`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol:18
```
require(tx.origin == owner)
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol

## Dependence on tx.origin
- SWC ID: 115
- Severity: Low
- Contract: TransactionStateDependency
- Function name: `distribute(address,uint256)`
- PC address: 269
- Estimated Gas Usage: 1471 - 1896

#### Description

Use of tx.origin as a part of authorization control.
The tx.origin environment variable has been found to influence a control flow decision. Note that using tx.origin as a security control might cause a situation where a user inadvertently authorizes a smart contract to perform an action on their behalf. It is recommended to use msg.sender instead.
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/1_AccessControl/6A_TransactionStateDependency/TransactionOriginAuth/TransactionOriginAuth.sol:18

#### Code

```
require(tx.origin == owner)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: distribute(address,uint256), txdata: 0xfb93210800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, decoded_data: ('0x0000000000000000000000000000000000000000', 0), value: 0x0


