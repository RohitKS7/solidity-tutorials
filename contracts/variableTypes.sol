// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  1st lesson is about variables types in solidity

contract SimpleStorage 
{
    //  most basic type are -
    // boolean = true / false
    // uint = a whole no. means isn't positive or negative no. 
    // int = a postive or negative whole no.
    // address = address of wallet or any blockchain
    // bytes = its is lower level type
    //  there are more which we learn later on

//    boolean
    // bool hasFavoriteNumber = false;
    bool hasFavoriteNumber = true;

//    uint
    uint256 favoriteNumber = 123;
    // we often specify how long should be value of uint in bytes 8 to 256 and if you don't specify the bytes then it will take the default 256
    
//    String
    string favoriteNumberInText = "Five";

//    int
    int256 favoriteInt = -5;

//   address
    address myAddress = 0xF6AD31B5e3CaCa96be527634ff811dbE3A7050f4;

//   bytes 
    // bytes only have 32 limit
    bytes32 favoriteBytes = "cat";

}
