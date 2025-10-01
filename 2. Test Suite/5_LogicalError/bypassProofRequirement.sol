pragma solidity ^0.8.0;

contract VulnerableBridge {
    mapping(address => uint256) public balances;
    mapping(bytes32 => bool) public processedTxs;
    bytes32 public trustedRoot; 

    function withdraw(
        address recipient,
        uint256 amount,
        bytes32 txHash,
        bytes32 proofRoot
    ) external {
    
        require(proofRoot == trustedRoot || proofRoot == bytes32(0x00), "Invalid proof");

        require(!processedTxs[txHash], "Already processed");

        balances[recipient] += amount;

        processedTxs[txHash] = true;

        (bool pass, ) = recipient.call{value: amount}("");
        require(pass, "Transfer failed");
    }
}
