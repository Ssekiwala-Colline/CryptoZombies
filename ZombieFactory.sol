//SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract ZombieFactory {

    // let our front-end know every time a new zombie was created, so the app can display it.
    event NewZombie(uint zombieId, string name, uint dna);
    
    //The zombie will be determined by a 16 digit number
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    //store the features of the zombie
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;
    
    //Adding a zombie to the factory based on the Name and DNA
    //Let's restrict external contracts from creating a zombie
    function _createZombie(string memory _name, uint _dna) private {

        //Let the function fire the NewZombie event after 
        //adding a new zombie to an array
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length -1;
        emit NewZombie(id, _name, _dna);
    } 

    //Let's generate a random DNA from a string
    function _generateRandomDna(string memory _str) private view returns (uint) {

        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    //Let's get the zombie's name and use it to generate a random DNA
    function createRandomZombie(string memory _name) public {

        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

