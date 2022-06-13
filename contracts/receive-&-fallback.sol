// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

/*  14th lesson, Advanced solidity => Receive and Fallback */

import "./priceConverter.sol";

// Now, when do we use 'Receive and Fallback'?
// we use it when someone send money without calling the fund function!
// How?
// One can send any amount to this contract with putting the Address of this contract in their metamask and click send button

// Becoz of this he didn't call the 'fund()' // which will be a real mess to track that person's address

// Thats why we use receive and fallback

// this is the example

contract FallbackExample {
    uint256 public result;

    // Fallback function must be declared as external.
    // FAllback is only gonna trigger if there is no Receive function else someone send money with some DATA
    fallback() external payable {
        result = 1;
    }

    // Receive function must be declared as external.
    // Receive is triggered whenever someone send any money to this contract but without any DATA
    receive() external payable {
        result = 2;
    }
}

// One can also send money with 'CallDAta' function 

    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()



