## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol
### Integer Arithmetic Bugs
- SWC ID: 101 in Contract `OddEven`
- Function name: `play(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:20
```
players[0].number + players[1].number
```
### External Call To User-Supplied Address
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21
```
players[n%2].addr.call.value(address(this).balance)("")
```
### Transaction Order Dependence
- SWC ID: 114 in Contract `OddEven`
- Function name: `play(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21
```
players[n%2].addr.call.value(address(this).balance)("")
```
### Unprotected Ether Withdrawal
- SWC ID: 105 in Contract `OddEven`
- Function name: `play(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21
```
players[n%2].addr.call.value(address(this).balance)("")
```
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:24
```
count = 0
```
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
### State access after external call
- SWC ID: 107 in Contract `OddEven`
- Function name: `play(uint256)`
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol

## Integer Arithmetic Bugs
- SWC ID: 101
- Severity: High
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 481
- Estimated Gas Usage: 49779 - 246227

#### Description

The arithmetic operator can overflow.
It is possible to cause an integer overflow or underflow in the arithmetic operation.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:20

#### Code

```
players[0].number + players[1].number
```

#### Initial State:

Account: [CREATOR], balance: 0x8000000000000004, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x20000000000000000, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: play(uint256), txdata: 0x6898f82b0000004000000000000000400000100200010280200240104010020110001000, decoded_data: (1725436586697640946952225071752911294762831684394001839166477157011456,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82bffffffc000000000000000000000100000002000100001008000004080804001, decoded_data: (115792087511879608725930038149998943677810197110069326424585522200399839248385,), value: 0xde0b6b3a7640000


## External Call To User-Supplied Address
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 619
- Estimated Gas Usage: 49779 - 246227

#### Description

A call to a user-supplied address is executed.
An external message call to an address specified by the caller is executed. Note that the callee account might contain arbitrary code and could re-enter any function within this contract. Reentering the contract in an intermediate state may lead to unexpected behaviour. Make sure that no state modifications are executed after this call and/or reentrancy guards are in place.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21

#### Code

```
players[n%2].addr.call.value(address(this).balance)("")
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x10000000000002000, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000002008010001048001014000010402080280040101, decoded_data: (182866197741589634932102877852124826311558693121,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980000000000000000000000000000000004088080, decoded_data: (69021166917929653742677606749405544097344080100432963291861481373392592994432,), value: 0xde0b6b3a7640000


## Transaction Order Dependence
- SWC ID: 114
- Severity: Medium
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 619
- Estimated Gas Usage: 49709 - 245874

#### Description

The value of the call is dependent on balance or storage write
This can lead to race conditions. An attacker may be able to run a transaction after our transaction which can change the value of the call
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21

#### Code

```
players[n%2].addr.call.value(address(this).balance)("")
```

#### Initial State:

Account: [CREATOR], balance: 0x1000c00400000002, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x20e60b6b3a7640002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: play(uint256), txdata: 0x6898f82b0000000000000000000000000000000000000000000000000000000000000000, decoded_data: (0,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898989898989898989898989898989898989898989898, decoded_data: (69021166917929653742677606750276713700772696741872022486264912820403120412824,), value: 0xde0b6b3a7640000


## Unprotected Ether Withdrawal
- SWC ID: 105
- Severity: High
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 619
- Estimated Gas Usage: 49709 - 245874

#### Description

Any sender can withdraw Ether from the contract account.
Arbitrary senders other than the contract creator can profitably extract Ether from the contract account. Verify the business logic carefully and make sure that appropriate security controls are in place to prevent unexpected loss of funds.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:21

#### Code

```
players[n%2].addr.call.value(address(this).balance)("")
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x405f0004847640100, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0410208002808008004008200401002000028008080108000880400080808001, decoded_data: (1837745254389276863553726053041397289260144912405538155940662436946738446337,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898982000048080108008802080001004024004080202, decoded_data: (69021166917929653742677606749588232194185956515161647533607660964023596745218,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 813
- Estimated Gas Usage: 49709 - 245874

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/7-2-1a_Bug/7-2-1a_Bug.sol:24

#### Code

```
count = 0
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 832
- Estimated Gas Usage: 49709 - 245874

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 859
- Estimated Gas Usage: 49709 - 245874

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 867
- Estimated Gas Usage: 49709 - 245874

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 884
- Estimated Gas Usage: 49709 - 245874

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 911
- Estimated Gas Usage: 49709 - 245874

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


## State access after external call
- SWC ID: 107
- Severity: Low
- Contract: OddEven
- Function name: `play(uint256)`
- PC address: 919
- Estimated Gas Usage: 49709 - 245874

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state. This issue is reported for internal compiler generated code.

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x8000000002000002, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [SOMEGUY], function: play(uint256), txdata: 0x6898f82b0000000000000000000000008080008080080101108080200400808080102080, decoded_data: (733605357777189086946164695843186743567172247680,), value: 0xde0b6b3a7640000
Caller: [ATTACKER], function: play(uint256), txdata: 0x6898f82b9898989898989898989898980040040004000840000280808020108002088001, decoded_data: (69021166917929653742677606749406971693491246866668030082629389779851345952769,), value: 0xde0b6b3a7640000


