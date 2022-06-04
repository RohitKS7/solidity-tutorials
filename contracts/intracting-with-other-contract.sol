// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  7th lesson is about "intracting with other contracts" in solidity.

import "./Importing-contracts-into-other-contracts.sol";

contract StorageFactory 
{
    SimpleStorage[] public simplestorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simplestorage = new SimpleStorage();
        simplestorageArray.push(simplestorage);
    }

//  Now what if we want to call "store" function from "simplestorage"
// sfStore = storagefactory Store
    function  sfStore(uint256 _simplestorageIndex, uint256 _simplestorageNumber) public {
        // So, in order to intract with any contract you need 2 things -
        // Address of contract and 
        // ABI code of that contract 
        //  now in order to get that data, first we are to get the "simplestroage contract "  object
        // and instead of using 'new' keyword we are putting the address of that contract like this
    // SimpleStorage simplestorage = SimpleStorage(simplestorageArray[_simplestorageIndex]);
        // you can see that as address we are putting the Array itself and the index of that array
        // another way to write that code is this, Why? cause = since  "SimpleStorage[]" is array of simplestorage contract we will get all the data from it (like- abi code)
        // but if it would only a array of "address[]" then we have to wrap this index in "SimpleStorage()" contract
    SimpleStorage simplestorage = simplestorageArray[_simplestorageIndex];
        
        // now lets call store function
    simplestorage.store(_simplestorageNumber);
        // but still we can't read the value of store function, 
        // so, lets create a new funtion for it
    }

    function sfGet(uint256 _simplestorageIndex) public view returns(uint256) {
    
    SimpleStorage simplestorage = simplestorageArray[_simplestorageIndex];
    return simplestorage.retriveve();

    }
}