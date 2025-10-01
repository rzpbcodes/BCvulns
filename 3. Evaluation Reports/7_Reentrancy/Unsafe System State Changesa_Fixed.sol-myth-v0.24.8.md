## Summary results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setOwner(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:32
```
owner = owner_
```
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setOwner(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:32
```
owner = owner_
```
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setOwner(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:33
```
owner
```
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setAuthority(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:40
```
authority = authority_
```
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setAuthority(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:40
```
authority = authority_
```
### State access after external call
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setAuthority(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:41
```
authority
```
### External Call To User-Supplied Address
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setOwner(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:57
```
authority.canCall(src, this, sig)
```
### External Call To User-Supplied Address
- SWC ID: 107 in Contract `DSAuth`
- Function name: `setAuthority(address)`
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:57
```
authority.canCall(src, this, sig)
```
# Analysis results for /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol

## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setOwner(address)`
- PC address: 479
- Estimated Gas Usage: 12497 - 69436

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:32

#### Code

```
owner = owner_
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setOwner(address), txdata: 0x13af4035, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setOwner(address)`
- PC address: 532
- Estimated Gas Usage: 12497 - 69436

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:32

#### Code

```
owner = owner_
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setOwner(address), txdata: 0x13af4035, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setOwner(address)`
- PC address: 539
- Estimated Gas Usage: 12497 - 69436

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:33

#### Code

```
owner
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setOwner(address), txdata: 0x13af4035, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setAuthority(address)`
- PC address: 704
- Estimated Gas Usage: 12519 - 69458

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:40

#### Code

```
authority = authority_
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setAuthority(address), txdata: 0x7a9e5e4b, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setAuthority(address)`
- PC address: 757
- Estimated Gas Usage: 12519 - 69458

#### Description

Write to persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:40

#### Code

```
authority = authority_
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setAuthority(address), txdata: 0x7a9e5e4b, value: 0x0


## State access after external call
- SWC ID: 107
- Severity: Medium
- Contract: DSAuth
- Function name: `setAuthority(address)`
- PC address: 763
- Estimated Gas Usage: 12519 - 69458

#### Description

Read of persistent state following external call
The contract account state is accessed after an external call to a user defined address. To prevent reentrancy issues, consider accessing the state only before the call, especially if the callee is untrusted. Alternatively, a reentrancy lock can be used to prevent untrusted callees from re-entering the contract in an intermediate state.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:41

#### Code

```
authority
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setAuthority(address), txdata: 0x7a9e5e4b, value: 0x0


## External Call To User-Supplied Address
- SWC ID: 107
- Severity: Low
- Contract: DSAuth
- Function name: `setOwner(address)`
- PC address: 1502
- Estimated Gas Usage: 12497 - 69436

#### Description

A call to a user-supplied address is executed.
An external message call to an address specified by the caller is executed. Note that the callee account might contain arbitrary code and could re-enter any function within this contract. Reentering the contract in an intermediate state may lead to unexpected behaviour. Make sure that no state modifications are executed after this call and/or reentrancy guards are in place.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:57

#### Code

```
authority.canCall(src, this, sig)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setOwner(address), txdata: 0x13af4035, value: 0x0


## External Call To User-Supplied Address
- SWC ID: 107
- Severity: Low
- Contract: DSAuth
- Function name: `setAuthority(address)`
- PC address: 1502
- Estimated Gas Usage: 12519 - 69458

#### Description

A call to a user-supplied address is executed.
An external message call to an address specified by the caller is executed. Note that the callee account might contain arbitrary code and could re-enter any function within this contract. Reentering the contract in an intermediate state may lead to unexpected behaviour. Make sure that no state modifications are executed after this call and/or reentrancy guards are in place.
In file: /home/visual/contracts/3.OpenSCV/openscv-subfolders-mythril/1-1-2a_Fixed/1-1-2a_Fixed.sol:57

#### Code

```
authority.canCall(src, this, sig)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [CREATOR], function: setAuthority(address), txdata: 0x7a9e5e4bdededededededededededededeadbeefdeadbeefdeadbeefdeadbeefdeadbeef, value: 0x0
Caller: [SOMEGUY], function: setAuthority(address), txdata: 0x7a9e5e4b, value: 0x0


