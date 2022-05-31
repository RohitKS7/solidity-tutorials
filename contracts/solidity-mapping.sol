// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  5th lesson is about mapping in solidity.
//  mapping is used to acces infomation from a big data junk because we can't do it only with array index method 
//  mapping = A mapping is a data structure (dictionory) where a key is 'mapped' (granted) to every single value 



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


    function store(uint256 _favoriteNumber) public {
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

