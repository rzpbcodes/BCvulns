## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-3a_Bug/7-1-3a_Bug.sol
### Unprotected Selfdestruct
- SWC ID: 106 in Contract `xyz`
- Function name: `destroy()`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-3a_Bug/7-1-3a_Bug.sol:13
```
selfdestruct(msg.sender)
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-3a_Bug/7-1-3a_Bug.sol

## Unprotected Selfdestruct
- SWC ID: 106
- Severity: High
- Contract: xyz
- Function name: `destroy()`
- PC address: 206
- Estimated Gas Usage: 132 - 227

#### Description

Any sender can cause the contract to self-destruct.
Any sender can trigger execution of the SELFDESTRUCT instruction to destroy this contract account and withdraw its balance to an arbitrary address. Review the transaction trace generated for this issue and make sure that appropriate security controls are in place to prevent unrestricted access.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-3a_Bug/7-1-3a_Bug.sol:13

#### Code

```
selfdestruct(msg.sender)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: destroy(), txdata: 0x83197ef0, value: 0x0


