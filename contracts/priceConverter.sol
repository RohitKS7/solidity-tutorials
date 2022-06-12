// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

// chainlink to get real world ether price in USD
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//  10th lesson, creating a solidity library for easily access functions -
// continued part of // Fundme.sol // lesson

/* What is Library in solidity?

A library contract is defined by using the library keyword instead of a general contract.
Libraries do not have any storage thus it cannot hold state variables,
fallback or payable functions also cannot be created inside the library as it cannot store ethers.
Libraries are not for changing the state of the contract, it can only be used for performing basic 
operations based on inputs and outputs.  However it can implement some data types like struct and enums which are user-defined,
and constant variables that are stored in a stack of Ethereum, not in storage. 

 */

library PriceConverter {
    
    function getPrice() internal view returns(uint256) {
        // since we intracting with outside contract, we need 
        // ABI = for abi we have imported an interface(talk about later) function from chainlink github/npm
        // Address = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e from (https://docs.chain.link/docs/ethereum-addresses/) rinkeby section ETH to USD
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        
        // now we will call latestRoundData() function and do something like this
        // (uint80 roundId, int price, uint startedAt, uint timeStamp, uint80 answeredInRound) = priceFeed.latestRoundData();
        // here we called call the variables in latestRoundData() function but we only need "price"
        (,int price,,, ) = priceFeed.latestRoundData(); // leave the comma as it is
        // price will be = Eth in terms of USD
        // and Solidity don't works with Decimal value for some reason 
        // and our price will come in this format = 300000000000,( => $3000.00000000 USD)
        return uint256(price * 1e10); // 1**10 == 10000000000 // since, price is in 'int' format we have to convert it in 'uint256'
        // we can do 'typecasting' like above "return uint256( price * 1e10)"

        // why using "1e10" ?
        // coz the "msg.value" gives eth in wei format [ 1e18 wei = 1 eth ] and our price comes in USD with 8 decimal(zeroes) 
        // so, the difference is of '10 decimals'
    }

// now convert the msg.value(Ether) in USD value
    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        // first call the getPrice() 
        uint256 ethPrice = getPrice();
        // now convert it 
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
        // ethAmount value?
        // becoz we used getConversionRate() with "msg.value", our ethAMount is now -> // ethAmount = msg.value \\
    }

}

