## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-1a_Fixed/5-2-1a_Fixed.sol
### Exception State
- SWC ID: 110 in Contract `NonPayloadAttackableToken`
- Function name: `transfer(address,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-1a_Fixed/5-2-1a_Fixed.sol:9
```
function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) {
   // do stuff
 }
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-1a_Fixed/5-2-1a_Fixed.sol

## Exception State
- SWC ID: 110
- Severity: Medium
- Contract: NonPayloadAttackableToken
- Function name: `transfer(address,uint256)`
- PC address: 160
- Estimated Gas Usage: 257 - 352

#### Description

An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/5-2-1a_Fixed/5-2-1a_Fixed.sol:9

#### Code

```
function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) {
   // do stuff
 }
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: transfer(address,uint256), txdata: 0xa9059cbb, value: 0x0


