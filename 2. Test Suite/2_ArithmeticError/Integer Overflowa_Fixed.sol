pragma solidity ^0.4.11;
//Integer Overflow
contract IntegerOverflowMappingSym1 {
 mapping(uint256 => uint256) map;
 function init(uint256 k, uint256 v) public {
  map[k] = add(map[k], v);
}



//from SafeMath
function add(uint256 a, uint256 b) public pure returns (uint256){
    uint256 c = a + b;
    require(c >= a, "SafeMath: addition overflow");
    return c;
  }

}