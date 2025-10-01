pragma solidity 0.4.25;
//Signedness Bugs
contract testSigness {
    mapping (address  => bool ) transferred;

    function withdrawOnce(int amount) public {
        if (amount > 1 ether || transferred[msg.sender]) {
            revert();
        }
        msg.sender.transfer(uint(amount));
        transferred[msg.sender] = true;
    }
}
