//SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract ZombieFactory {
    
    //The zombie will be determined by a 16 digit number
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    //store the features of the zombie
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;
    
    //Let's now create the zombies using a function
    function createZombie(string memory _name, uint _dna) public {
        
    } 

}

