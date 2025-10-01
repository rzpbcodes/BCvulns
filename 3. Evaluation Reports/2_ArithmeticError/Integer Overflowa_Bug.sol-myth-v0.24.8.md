## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol
### Exception State
- SWC ID: 110 in Contract `IntegerOverflowMappingSym1`
- Function name: `constructor`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:3
```
contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] += v;
    }
}
```
### Exception State
- SWC ID: 110 in Contract `IntegerOverflowMappingSym1`
- Function name: `fallback`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:3
```
contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] += v;
    }
}
```
### Integer Arithmetic Bugs
- SWC ID: 101 in Contract `IntegerOverflowMappingSym1`
- Function name: `init(uint256,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:7
```
map[k] += v
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol

## Exception State
- SWC ID: 110
- Severity: Medium
- Contract: IntegerOverflowMappingSym1
- Function name: `constructor`
- PC address: 11
- Estimated Gas Usage: 36 - 131

#### Description

An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:3

#### Code

```
contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] += v;
    }
}
```

#### Initial State:

Account: [CREATOR], balance: 0x2, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x1


## Exception State
- SWC ID: 110
- Severity: Medium
- Contract: IntegerOverflowMappingSym1
- Function name: `fallback`
- PC address: 57
- Estimated Gas Usage: 64 - 159

#### Description

An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:3

#### Code

```
contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] += v;
    }
}
```

#### Initial State:

Account: [CREATOR], balance: 0x1, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: unknown, txdata: 0x, decoded_data: , value: 0x0


## Integer Arithmetic Bugs
- SWC ID: 101
- Severity: High
- Contract: IntegerOverflowMappingSym1
- Function name: `init(uint256,uint256)`
- PC address: 122
- Estimated Gas Usage: 6081 - 26366

#### Description

The arithmetic operator can overflow.
It is possible to cause an integer overflow or underflow in the arithmetic operation.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-1-2a_Bug/6-1-2a_Bug.sol:7

#### Code

```
map[k] += v
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: init(uint256,uint256), txdata: 0xa5843f08000000080000000010000100008000080040804001008000020080000004040440, decoded_data: (215679573337597437589945061898715935051538863973113159177062450463748, 28948022309329048855892746252171976963317496166410141009864396001978282409984), value: 0x0
Caller: [SOMEGUY], function: init(uint256,uint256), txdata: 0xa5843f080000000800000000100001000080000800408040010080000200800000040404ec, decoded_data: (215679573337597437589945061898715935051538863973113159177062450463748, 106745832265650867656104501804884165052233267113637394973874960257294916386816), value: 0x0


