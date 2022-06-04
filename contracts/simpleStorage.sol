// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  6th lesson is about "how to import contract into other contract in solidity.

// Solidity code complies in EVM so, we can use solidity on every blockchain that impliments anytype of EVM
// like= Avalanche, Fantom, Polygon

// The ablity of contracts to intract with eachother is known as composiblity( smart contract are composible cause they can easily intract with each other

contract SimpleStorage 
{
    uint256 favoriteNumber;

// string(name) is gonna map for a specific uint256 (number)
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
       uint256 favoriteNumber;
       string name;
    }

    People[] public people;


    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retriveve() public view returns(uint256){
        return favoriteNumber;
    }


    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        // now we specify the number for key
        // name is a key and favoritenumber is the information we want to access
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}

//  congrats you have completed this lesson, see you in next lesson

