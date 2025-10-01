## Summary results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol
### Delegatecall to user-supplied address
- SWC ID: 112 in Contract `VulnerableDelegeateCALL`
- Function name: `forwardToWorker(address,bytes)`
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol:14
```
workerAddress.delegatecall(callData)
```
# Analysis results for /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol

## Delegatecall to user-supplied address
- SWC ID: 112
- Severity: High
- Contract: VulnerableDelegeateCALL
- Function name: `forwardToWorker(address,bytes)`
- PC address: 137
- Estimated Gas Usage: 1885 - 38848

#### Description

The contract delegates execution to another contract with a user-supplied address.
The smart contract delegates execution to a user-supplied address.This could allow an attacker to execute arbitrary code in the context of this contract account and manipulate the state of the contract account or execute actions on its behalf.
In file: /home/visual/contracts/beta-contracts/1.sdb-subfolders-critical/4_ImproperInputValidation/1E_VulnerableDelegateCALL/VulnerableDelegateCALL/VulnerableDelegateCALL.sol:14

#### Code

```
workerAddress.delegatecall(callData)
```

#### Initial State:

Account: [CREATOR], balance: 0x0, nonce:0, storage:{}
Account: [ATTACKER], balance: 0x0, nonce:0, storage:{}

#### Transaction Sequence

Caller: [CREATOR], calldata: , decoded_data: , value: 0x0
Caller: [ATTACKER], function: forwardToWorker(address,bytes), txdata: 0x8d4cf36c000000000000000000000000deadbeefdeadbeefdeadbeefdeadbeefdeadbeef00000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000, decoded_data: ('0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef', ''), value: 0x0


