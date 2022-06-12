// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

/*  9th lesson, in this lesson we are creating a contract with this functionalities -
  Get funds from users 
  Withdraw funds
  Set a minimum funding value in USD */


// now, we want to set the msg.value >= minimumUSD, but the value is in Ether and we are setting it in USD
// So, to convert Ether in USD we use Oracles like chainlink
// Created a function to get the price of ether in USD in "priceConverter.sol" library

import "./priceConverter.sol";


contract FundMe{

    using PriceConverter for uint256;

// why multipy by 1e18, because we get the price in this form from getPrice()
    uint256 public minimumUSD = 50 * 1e18;

// SO, to keep the track of senders(funders) lets create Array and mapping
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

//  Creating a constructor So, only the owner of funds can withdraw it

    address public owner;
     
    constructor(){
        owner = msg.sender;
    }

// "payable" keyword gives our function an ablity to store native token of any blockchain
    function fund() public payable{
            //  Want to be able to set a minimum fund amount in USD
            // 1. How do we send ETH to this contract?

            // now we have "payable", we can access the value attribute with a Global Keyword 
        // msg.value;
            //  now, lets say we want to set a minimum value one can send. So, we are using require keyword
        require(msg.value.getConversionRate() >= minimumUSD, "Don't Have Enough Eth"); // great then 1-Eth (1e18 = 1000000000000000000 wei)
            // So, here require function is a checker if value > 1 Eth  then ok!, else it "revert" it like- 'dont have enough eth'
            // what is Reverting?
            // Undo any action that happend before, and send remaining gas back

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        // like msg.value, msg.sender is also a global variable always available for use
            
    }

//  NEW Lesson "Basic Loops in Solidity" date = 10, june 2022, time = 7:10

    function withdraw() public {
        require(msg.sender == owner, "Withdrawal is not owner"); // this will make sure that the withdrawal person is owner
        // but what if we have to check about owner in mutliple places in whole contract 
        // that why we are using "modifers" check => "modifer.sol" file

        // Since, as we are withdrawing all the funds from this 'funders' array, we probably want to reset all the funds to ZERO(0)
        // so, we will loop through this funders array and update our mapping object so that each of this funders now have zero
        // for loop = " for(/* starting index, ending index, step amount*/) "
        // starting index => funderIndex = 0; means fundersIndex is set to 0
        // ending index => funderIndex < funders.length; // funderIndex needs to be less than funders array length \\
        // atep amount => funderIndex = funderIndex + 1; or funderIndex++
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            // to access zeroth element of funders array => funders(funderIndex) \\  which is 0 in value //  
            address funder = funders[funderIndex]; 
            // now, update the mappping to zero 
            addressToAmountFunded[funder] = 0;
        }

        // now resetting the array \\
        // we now creating a whole new array with 0 objects in it means blank
        funders = new address[](0);

        // now sending Eth from a contract or Withdrawing funds
        // we are learing all 3 different ways to with native blockchain currrency
        // 1. Trasnfer, 2. Send , 3. Call

        // 1. Transfer \\ (2300 gas, throws error) = revert the process // and sending eth costs 21000 gas
        // msg.sender = address 
        // payable(msg.sender) = payable address (address that can send eth)
       /* payable(msg.sender).transfer(address(this).balance); */ // "the lexical scope of "this" keyword is whole contract

        // 2. Send \\ (2300 gas, return bool) // returns boolean if txn is succesful or not but don't revert it 
        //  to revert it 
        /* bool sendSuccess = payable(msg.sender).transfer(address(this).balance);
        require(sendSuccess, "send failed"); */

        // 3. Call \\ (forward all gas or set gas, returns bool)
        // with is very power keyword with this we can call anything from ethereum
        // call function returns 2 variable = (bool callSuccess, bytes memory dataReturned)
        // and since we are not calling any function here , so we don't need second dataReturned variable
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
}


