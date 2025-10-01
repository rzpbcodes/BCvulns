## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-3-2a_Fixed/6-3-2a_Fixed.sol
### Unprotected Ether Withdrawal
- SWC ID: 105 in Contract `testSigness`
- Function name: `withdrawOnce(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-3-2a_Fixed/6-3-2a_Fixed.sol:10
```
msg.sender.transfer(uint(amount))
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-3-2a_Fixed/6-3-2a_Fixed.sol

## Unprotected Ether Withdrawal
- SWC ID: 105
- Severity: High
- Contract: testSigness
- Function name: `withdrawOnce(uint256)`
- PC address: 267
- Estimated Gas Usage: 7926 - 63247

#### Description

Any sender can withdraw Ether from the contract account.
Arbitrary senders other than the contract creator can profitably extract Ether from the contract account. Verify the business logic carefully and make sure that appropriate security controls are in place to prevent unexpected loss of funds.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-3-2a_Fixed/6-3-2a_Fixed.sol:10

#### Code

```
msg.sender.transfer(uint(amount))
```

#### Initial State:

Account: [CREATOR], balance: 0xc00004100000928, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8cab61845883c22, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: withdrawOnce(uint256), txdata: 0x9c3db4a9, value: 0x0
Caller: [ATTACKER], function: withdrawOnce(uint256), txdata: 0x9c3db4a900000000000000000000000000000000000000000000000001, decoded_data: (72057594037927936,), value: 0x0


