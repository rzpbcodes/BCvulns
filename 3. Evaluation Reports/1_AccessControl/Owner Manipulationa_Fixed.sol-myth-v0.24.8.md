## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol
### Transaction Order Dependence
- SWC ID: 114 in Contract `HOTTO`
- Function name: `withdraw()`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol:20
```
owner.transfer(etherBalance)
```
### Unprotected Ether Withdrawal
- SWC ID: 105 in Contract `HOTTO`
- Function name: `withdraw()`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol:20
```
owner.transfer(etherBalance)
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol

## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: HOTTO
- Function name: `withdraw()`
- PC address: 397
- Estimated Gas Usage: 3405 - 38346

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol:20

#### Code

```
owner.transfer(etherBalance)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: HT(), txdata: 0x08190cda, value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


## Unprotected Ether Withdrawal
- SWC ID: 105
- Severity: High
- Contract: HOTTO
- Function name: `withdraw()`
- PC address: 397
- Estimated Gas Usage: 3405 - 38346

#### Description

Any sender can withdraw Ether from the contract account.
Arbitrary senders other than the contract creator can profitably extract Ether from the contract account. Verify the business logic carefully and make sure that appropriate security controls are in place to prevent unexpected loss of funds.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-1-2a_Fixed/7-1-2a_Fixed.sol:20

#### Code

```
owner.transfer(etherBalance)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: HT(), txdata: 0x08190cda, value: 0x0
Caller: [ATTACKER], function: withdraw(), txdata: 0x3ccfd60b, value: 0x0


