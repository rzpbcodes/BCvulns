pragma solidity 0.5.0;
//Missing verification for program termination - L13
contract xyz {
    address public owner; //owner is the owner of the contrac t

    //[several lines of code]

    constructor() public {
        owner = msg.sender;
    }

    function destroy() public {
        selfdestruct(msg.sender);
    }
}
