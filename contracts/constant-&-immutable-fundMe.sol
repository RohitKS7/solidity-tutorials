// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

/*  12th lesson, Advanced solidity => creating this contract little bit more professional*/
// Constant and Immutable

// In both cases, the variables cannot be modified after the contract has been constructed. 
// For constant variables, the value has to be fixed at compile-time, while for immutable ,
// it can still be assigned at construction time.


// Constant = we can declare any state variable which will never change in future
// by declaring constant we are also saving our Gas
import "./priceConverter.sol";

// GAS cost whole contract without constant keyword = 856,373
// GAS cost whole contract with constant  keyword = 836,795

contract FundMe{

    using PriceConverter for uint256;

// Constant convension have differnt naming => AllCaps WITH underscores
    uint256 public constant MINIMUM_USD = 50 * 1e18;
   /* 21415 gas of only MINIMUM_USD -> constant 
    21415 * 51000000000  = 32122500000000 wei
    0.0000321225 eth = in USD 0.0000321225 * 1500 = 0.048 USD */

    /* 23515 gas -> without constant
       23515 * 51000000000 = 1199265000000000 wei
       0.001199265 eth = 1.79 USD */


    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    // 21,508 = immutable
    // 21,544 = without immutable
     
    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Don't Have Enough Eth"); 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;     
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex]; 
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner{
        require (msg.sender == i_owner, "Withdrawal is not owner");
        _;
    }
}

