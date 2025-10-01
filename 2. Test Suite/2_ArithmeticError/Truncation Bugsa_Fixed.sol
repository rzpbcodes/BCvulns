pragma solidity 0.8.0;
//Truncation Bugs
contract testTruncate {
    mapping(address => uint256) balance;

    function getBalance() public payable {
        balance[msg.sender] = uint256(msg.value);
    }
}
