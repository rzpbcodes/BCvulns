pragma solidity ^0.4.25;
//Owner Manipulation - L7
contract HOTTO  {
   address owner = msg.sender;
   
   function HT() public {
   owner = msg.sender;
   // distr(owner, totalDistributed);
   }

modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

  function withdraw() onlyOwner public {
    address myAddress = this;
    uint256 etherBalance = myAddress. balance;
    owner.transfer(etherBalance);
 }
 }
