## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-1a_Bug/6-2-1a_Bug.sol
### Exception State
- SWC ID: 110 in Contract `ContractOperations`
- Function name: `divOperation(uint256,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-1a_Bug/6-2-1a_Bug.sol:28
```
numberOne.div(numberTwo)
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-1a_Bug/6-2-1a_Bug.sol

## Exception State
- SWC ID: 110
- Severity: Medium
- Contract: ContractOperations
- Function name: `divOperation(uint256,uint256)`
- PC address: 256
- Estimated Gas Usage: 280 - 375

#### Description

An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-1a_Bug/6-2-1a_Bug.sol:28

#### Code

```
numberOne.div(numberTwo)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: divOperation(uint256,uint256), txdata: 0x747f15e7, value: 0x0


