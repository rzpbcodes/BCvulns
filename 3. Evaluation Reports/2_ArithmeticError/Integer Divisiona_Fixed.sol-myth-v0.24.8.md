## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol
### Integer Arithmetic Bugs
- SWC ID: 101 in Contract `DivisionFixed`
- Function name: `calcul(uint256,uint256,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:8
```
10**precision
```
### Integer Arithmetic Bugs
- SWC ID: 101 in Contract `DivisionFixed`
- Function name: `calcul(uint256,uint256,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:8
```
a*(10**precision)
```
### Exception State
- SWC ID: 110 in Contract `DivisionFixed`
- Function name: `calcul(uint256,uint256,uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:6
```
function calcul(uint a, uint b, uint precision) public view returns ( uint) {

     return a*(10**precision)/b;
 }
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol

## Integer Arithmetic Bugs
- SWC ID: 101
- Severity: High
- Contract: DivisionFixed
- Function name: `calcul(uint256,uint256,uint256)`
- PC address: 170
- Estimated Gas Usage: 399 - 1105

#### Description

The arithmetic operator can overflow.
It is possible to cause an integer overflow or underflow in the arithmetic operation.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:8

#### Code

```
10**precision
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: calcul(uint256,uint256,uint256), txdata: 0x6fe2df87010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101014000000000000000000000000000000000000000000000000000000000000002, decoded_data: (454086624460063511464984254936031011189294057512315937409637584344757371137, 454086624460063511464984254936031011189294057512315937409637584344757371137, 28948022309329048855892746252171976963317496166410141009864396001978282409986), value: 0x0


## Integer Arithmetic Bugs
- SWC ID: 101
- Severity: High
- Contract: DivisionFixed
- Function name: `calcul(uint256,uint256,uint256)`
- PC address: 172
- Estimated Gas Usage: 399 - 1105

#### Description

The arithmetic operator can overflow.
It is possible to cause an integer overflow or underflow in the arithmetic operation.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:8

#### Code

```
a*(10**precision)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: calcul(uint256,uint256,uint256), txdata: 0x6fe2df8700028200000000000000000000460c000000000000000000000000000000000102024002100408012008020402028000041002408020080810200408040201802008800880022040020201102001400120020802404001801040040402404040, decoded_data: (4430921154639541951533113265143947851801936703000647934293756249043369985, 908601158668832509610587048448891168521960045888544649314783298213346673024, 14489029583875561941608089181930872856139943987511919685999761203111013662784), value: 0x0


## Exception State
- SWC ID: 110
- Severity: Medium
- Contract: DivisionFixed
- Function name: `calcul(uint256,uint256,uint256)`
- PC address: 179
- Estimated Gas Usage: 312 - 737

#### Description

An assertion violation was triggered.
It is possible to trigger an assertion violation. Note that Solidity assert() statements should only be used to check invariants. Review the transaction trace generated for this issue and either make sure your program logic is correct, or use require() instead of assert() if your goal is to constrain user inputs or enforce preconditions. Remember to validate inputs from both callers (for instance, via passed arguments) and callees (for instance, via return values).
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/6-2-2a_Fixed/6-2-2a_Fixed.sol:6

#### Code

```
function calcul(uint a, uint b, uint precision) public view returns ( uint) {

     return a*(10**precision)/b;
 }
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: calcul(uint256,uint256,uint256), txdata: 0x6fe2df87000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000820208040800408200140100220088000010040028000082080208080012000, decoded_data: (0, 0, 3675266208287959390232037358714679366563214692764096360258994842033463566336), value: 0x0


