// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

/*  13th lesson, Advanced solidity => creating custom 'error' instead of rquire to save gas cost*/

import "./priceConverter.sol";

// Yes, You have write the error ouside of contract 
error NotOwner();

contract FundMe{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

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
        // require (msg.sender == i_owner, "Withdrawal is not owner");  //Replaced with Custom Error\\
        if(msg.sender != i_owner) {revert NotOwner();}
        _;
    }
}

