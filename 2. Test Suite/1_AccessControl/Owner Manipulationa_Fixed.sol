pragma solidity ^0.4.25;
//Owner Manipulation
contract HOTTO  {
address private owner = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;    

   
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
