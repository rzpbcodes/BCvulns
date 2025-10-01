pragma solidity ^0.4.25;
//Divide by Zero
 /* Taken from the OpenZeppelin github
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

  /*
  * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0); // Solidity only automatically asserts when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }


}


contract ContractOperations {

    using SafeMath for uint256;
    uint256 public numberResult = 0;
     
   
                function divOperation(uint256 numberOne, uint256 numberTwo) external returns (uint256) {

                            numberResult= numberOne.div(numberTwo);
                            return numberResult;

                }

    }

