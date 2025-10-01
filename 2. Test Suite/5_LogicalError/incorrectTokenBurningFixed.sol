pragma solidity ^0.8.0;

contract TokenBurn {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    // Event for burning tokens
    event Burn(address indexed account, uint256 amount);

    constructor() {
        totalSupply = 1000000; // Initial supply of tokens
    }

    // Mint tokens to an address (for demo purposes)
    function mint(address account, uint256 amount) public {
        require(account != address(0), "Cannot mint to the zero address");
        balances[account] += amount;
        totalSupply += amount;
    }

    // Burn tokens from an account
    function burn(address account, uint256 amount) public {
        require(account != address(0), "Cannot burn from the zero address");
        require(balances[account] >= amount, "Insufficient balance to burn");

        // Decrease the balance of the account
        balances[account] -= amount;

        // Decrease the total supply
        totalSupply -= amount;

        // Emit the burn event
        emit Burn(account, amount);
    }

    // View function to check balance of an account
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
