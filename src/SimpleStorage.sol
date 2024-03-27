// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // stating our version

contract SimpleStorage {
    // favoriteNumber gets initialized to 0 if no value is assigned to it

    uint256 myFavoriteNumber; // 0

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    // create custom variable types using the struct keyword
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // a dynamic array that holds variables of type Person
    Person[] public listOfPeople;

    // a mapping variable
    mapping (string => uint256) public nameToFavoriteNumber;

    function retrieve() public view returns (uint256){
        return myFavoriteNumber;
    }

    // function that lets us add people into the array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) );
        // map the name to favorite number
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}