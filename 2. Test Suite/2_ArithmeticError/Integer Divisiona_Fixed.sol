pragma solidity 0.5.0;
//Integer Division
contract DivisionFixed {
    function calcul(uint a, uint b, uint precision) public view returns (uint) {
        return (a * (10 ** precision)) / b;
    }
}
