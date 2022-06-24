// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

//  ANCHOR  6th lesson is about "how to import contract into other contract in solidity.

contract SimpleStorage {
    uint256 favoriteNumber;

    // NOTE string(name) is gonna map for a specific uint256 (number)
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retriveve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
