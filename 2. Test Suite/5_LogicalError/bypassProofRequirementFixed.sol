pragma solidity ^0.8.0;

contract SecureBridge {
    mapping(address => uint256) public balances;
    mapping(bytes32 => bool) public processedTxs;
    bytes32 public trustedRoot; 

    // Set the trusted root through the constructor
    constructor(bytes32 _trustedRoot) {
        trustedRoot = _trustedRoot;
    }

    function withdraw(
        address recipient,
        uint256 amount,
        bytes32 txHash,
        bytes32 proofRoot
    ) external {
        // Require the proof to match the trusted root
        require(proofRoot == trustedRoot, "Invalid proof");

        // Prevent double-spending by ensuring the transaction has not been processed
        require(!processedTxs[txHash], "Already processed");

        // Add the amount to the recipient's balance
        balances[recipient] += amount;

        // Mark the transaction as processed to prevent reuse
        processedTxs[txHash] = true;

        // Attempt to transfer the funds to the recipient
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Transfer failed");
    }
}
