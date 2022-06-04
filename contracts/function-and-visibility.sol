// SPDX-License-Identifier: GPL-3.0  

pragma solidity ^0.8.8;

//  Adding license and version is most important thing for smart contract

//  2nd lesson is about function and visibility (briefly) in solidity


contract SimpleStorage 
{
    //  if we dont give any value to the variable then it take the default value which is 0
    //  visibility are of 4 types
    //  public = by giving  public we are creating a getter fucntion for that variable which we dont do more often and everybody can see and interact with this contract
    //  private = means only this specific contract can call this function
    //  external = means somebody outside this contract can call this func
    //  internal = means only this and its children contracts can call this func

    //  if we dont give any visibility to this contract it takes the default one which is internal
    uint256 public favoriteNumber;

    // function
    // (uint256 _favoriteNumber) = this is function's parameter
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //  we calling a view functin here thats why now for reading it will cost gas
        retriveve();
    }

    // so we can also retriveve our favorite no. value by creating a new function
    // lets talk about view
    // "view" this to keyword are gasless means by putting this keywords in function we are saying to blockchain that I'm only viewing it not making any changes and modification
    // "pure" is a similar keyword with mostly same work but we cant read the value with this.
    
    // calling view is free until we call it, in a gas consuming funciton like upper one 
    function retriveve() public view returns(uint256){
        return favoriteNumber;
    }

    // we use pure keyword on that function which we dont want to read like any calculation function
    function add() public pure returns(uint256){
        return 1 + 1;
    }

}

// Every single smart contact have its address like our metamask address
// 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B = contract address of this contract