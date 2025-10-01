## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-2a-Bug/5-2-2a-Bug.sol
### requirement violation
- SWC ID: 123 in Contract `0x72c68108a82e82617b93d1be0d7975d762035015`
- Function name: `baz(int256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-2a-Bug/5-2-2a-Bug.sol:6
```
f
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-2a-Bug/5-2-2a-Bug.sol

## requirement violation
- SWC ID: 123
- Severity: Medium
- Contract: 0x72c68108a82e82617b93d1be0d7975d762035015
- Function name: `baz(int256)`
- PC address: 145
- Estimated Gas Usage: 217 - 312

#### Description

A requirement was violated in a nested call and the call was reverted as a result.
Make sure valid inputs are provided to the nested call (for instance, via passed arguments).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-2a-Bug/5-2-2a-Bug.sol:6

#### Code

```
f
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: doubleBaz(), txdata: 0x22de79cc, value: 0x0


