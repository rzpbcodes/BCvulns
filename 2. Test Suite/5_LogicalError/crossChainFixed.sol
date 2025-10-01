pragma solidity ^0.8.0;

contract CrossChainBridge {
    mapping(address => uint256) public balances;
    mapping(bytes32 => bool) public processedDeposits; // To track processed deposits

    // Event declarations for deposit and withdrawal actions
    event Deposited(address indexed recipient, uint256 amount);
    event Withdrawn(address indexed recipient, uint256 amount);

    // This function is called when a cross-chain deposit is made
    function deposit(address recipient, uint256 amount, bytes32 depositHash) external {
        // Ensure that the deposit is not already processed
        require(!processedDeposits[depositHash], "Deposit already processed");

        // Simulating that the deposit has been made
        balances[recipient] += amount;

        // Mark this deposit as processed
        processedDeposits[depositHash] = true;

        // Emit the deposit event
        emit Deposited(recipient, amount);
    }

    // Function to withdraw funds from the contract
    function withdraw(address recipient, uint256 amount) external {
        require(balances[recipient] >= amount, "Insufficient balance");

        // Update the balance before transferring to prevent reentrancy attacks
        balances[recipient] -= amount;

        // Emit the withdrawal event before transferring
        emit Withdrawn(recipient, amount);

        // Transfer the funds (ensuring no reentrancy)
        payable(recipient).transfer(amount);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}
