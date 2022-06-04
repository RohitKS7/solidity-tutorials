// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.0;

//  Adding license and version is most important thing for smart contract

//  8th lesson is about "inheritence and overrides" in solidity.
//  if we want to modify some function of simplestorage contract then we can use inheritence

import "./simpleStorage.sol";

//  now our ExtraStorage contract inheritate all the functionality of simplestorage contract
contract ExtraStorage is SimpleStorage
{
    //  now lets say we want to add +5 in every favoriteNumber (simpleStorage one)
    // we can do something called "overrid"ing the functions and we use two words - "virtual" or "override"
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }

    // NOTE = in order to modify parent function you have write "virtual" keyword on that modifying function in Parent contract itself
    //  and use "override" keyword here

}