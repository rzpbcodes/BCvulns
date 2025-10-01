pragma solidity ^0.8.0;

contract TokenBurn {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    constructor() {
        totalSupply = 1000000; // Initial supply of tokens
    }

    function burn(address account, uint256 amount) public {
        balances[account] -= amount;  
        totalSupply -= amount;  
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
