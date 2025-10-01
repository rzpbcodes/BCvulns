pragma solidity 0.5.0;
//Missing verification for program termination
contract xyz {
    address public owner; //owner is the owner of the contrac t

    //[several lines of code]

    constructor() public {
        owner = msg.sender;
    }

    function destroy() public {
        require(msg.sender == owner);
        selfdestruct(msg.sender);
    }
}
