// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.0;

import "./priceConverter.sol";

error NotOwner();

contract FundMe{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
     
    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
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
        if(msg.sender != i_owner) revert NotOwner();
        _;
    }

// What if someone send money without calling the fund() function

    fallback() external payable{
        fund();
    }
    
    receive() external payable{
        fund();
    }
}
