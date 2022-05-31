// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  3rd lesson is about arrays and structs in solidity.
//  structs and arrays are used to store multiple value at a time 


contract SimpleStorage 
{
    uint256 favoriteNumber;

    // now we have new type called "Pople" and we are asigning 'person' to this type. then storing our desired value in person
    // so, you can say person is same, what favoriteNumber is for uint256. A name assigned for that type
    // People public person = People({favoriteNumber: 2, name: "rohit"});
    // now if we want to add more persons name and favoriteNumber then we have do this, (which is not a good option)
    // People public person2 = People({favoriteNumber: 3, name: "kumar"});
    // People public person3 = People({favoriteNumber: 4, name: "suman"});

//  this is a new type of variable like string, uint.
    struct People {
       uint256 favoriteNumber;
       string name;
    }

    // so , we will ne doing this thing with "array"
    // this type of array are called dynamic array becoz the size of the arrau is not defined  intially
    People[] public people;

//  now this is static array which only consist 3 values becoz we defined it in bracket of array
    // People[3] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retriveve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        //  this is like a shorthand technique
        // people.push(People(_favoriteNumber, _name));
        
        // this is long way but easy to understand
        People memory newPerson = People(_favoriteNumber, _name);
       
     // People memory newPerson = People({name: _name, favoriteNumber: _favoriteNumber});

        people.push(newPerson);
    }

}

//  congrats you have completed this lesson, see you in next lesson

