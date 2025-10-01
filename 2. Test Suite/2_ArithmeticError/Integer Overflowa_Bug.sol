pragma solidity ^0.4.11;
//Integer Overflow
contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    function init(uint256 k, uint256 v) public {
        map[k] += v;
    }
}
