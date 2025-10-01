pragma solidity 0.8.0;
//Truncation Bugs
contract testTruncate {
    mapping(address => uint32) balance;

    function getBalance() public payable {
        balance[msg.sender] = uint32(msg.value);
    }
}
