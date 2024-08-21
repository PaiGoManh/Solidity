// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract MyContract{

    //String int bool uint address
    string public greeting = "Hello World";

    function getGreeting() external  view returns(string memory) { // when using string you have to access a temperory variable

        return greeting;
    }

    function calc(uint _a,uint _b) public pure returns(uint){
        return _a+_b;
    }


    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    //constructor
    address public owner;
    constructor(){
        owner = msg.sender; //who ever deploy the contract its the owner 
    }

    // Global Variables in
    // msg.sender-the owner
    // msg.value
    // block -- block.number,block.chainid,block.timestamp 
    // tx.origin
    // this -its represnt a particular contact
    uint public balance =address(this).balance;


    


}