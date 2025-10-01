pragma solidity ^0.8.0;

contract CrossChainBridge {
    mapping(address => uint256) public balances;

    function deposit(address recipient, uint256 amount) external {
        // Assumes that deposit is valid, but doesn't verify the real cross-chain deposit
        balances[recipient] += amount;
    }

    function withdraw(address recipient, uint256 amount) external {

        require(balances[recipient] >= amount, "Insufficient balance");

        balances[recipient] -= amount;
        payable(recipient).transfer(amount);
    }
}
