// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  4th lesson is about memory , storage, calldata (intro) in solidity.
//  You can store infomation in EVM in six places -
// 1. Stack
// 2. Memory
// 3. storage
// 4. Calldata
// 5. Code.
// 6. Logs.

contract SimpleStorage 
{
    uint256 favoriteNumber;

    struct People {
       uint256 favoriteNumber;
       string name;
    }

    People[] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retriveve() public view returns(uint256){
        return favoriteNumber;
    }

// we are mainly focusing on Calldata , Memory and storage right now
// Calldata and Memory = when we use this in any vaiable means that this varable only exists temporarily
// calldata variables can't be modified 
// memory variables can be modified
// Storage is permanent.
// variavles inside function by defalut stored in stack of function temporarily 
//  but string, arrays and structs by defalut stored in stroage thats why we declare memeory 
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
    }

}

//  we will discuss more about it later 
//  congrats you have completed this lesson, see you in next lesson

