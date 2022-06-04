// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  6th lesson is about "how to import contract into other contract in solidity.

//  this contract is going to deploy 'simplestorage' contract


//  First technique to do this is copy the whole contract code from 'simplestorge' contract and make a global variable in 'storageFactory' contract
//  and obviously this method is bad for multiple contract importing

//  So, Instead we are going to use "import" Method ---


import "./simpleStorage.sol";


// contract SimpleStorage 
// {
//     uint256 favoriteNumber;

// // string(name) is gonna map for a specific uint256 (number)
//     mapping(string => uint256) public nameToFavoriteNumber;

//     struct People {
//        uint256 favoriteNumber;
//        string name;
//     }

//     People[] public people;


//     function store(uint256 _favoriteNumber) public {
//         favoriteNumber = _favoriteNumber;
//     }
    
//     function retriveve() public view returns(uint256){
//         return favoriteNumber;
//     }


//     function addPerson(string memory _name, uint256 _favoriteNumber) public{
//         people.push(People(_favoriteNumber, _name));
//         // now we specify the number for key
//         // name is a key and favoritenumber is the information we want to access
//         nameToFavoriteNumber[_name] = _favoriteNumber;
//     }

// }

//  contract which will deploy the simplestorage contract
contract StorageFactory 
{
//  make a global variable 
    // SimpleStorage public simplestorage;

    // To keep track of every contract created we use array like this-

    SimpleStorage[] public simplestorageArray;

    // create a funtion which can actually deploy SimpleStorage(fileName- importing-contracts-into-other-contracts) contract
    function createSimpleStorageContract() public {
        //  this "new" keyword knows that now I have to deploy a new contract
        // simplestorage = new SimpleStorage();

        //  saving as memory variable
        SimpleStorage simplestorage = new SimpleStorage();
        simplestorageArray.push(simplestorage);

    }

}

//  congrats you have completed this lesson, see you in next lesson

