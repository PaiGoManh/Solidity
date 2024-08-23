// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract Book {

    string public title;
    uint public price;
    address public owner;
    bool sold;
    address [] public buyers;

    function setBook (string memory x,uint y) public {
        title = x;
        price = y;
    }

    function getBook () public view returns (string memory,uint) {
        return (title,price);
    }

    function toWei (uint amt) public pure returns(uint){
        return (amt*1000000000000000000);
    }

    function buyBook () public payable {
        require(toWei(price)<=msg.value,"book price is not correct, insufficient value");
        // if(toWei(price)<=msg.value){
            owner = msg.sender;
            buyers.push(owner);
            sold=true;
            uint bal = msg.value - toWei(price);
            if(bal>0){
                payable (msg.sender).transfer(bal);
            }

        // }
    }

    function buyersCount() public view returns(uint){
        return (buyers.length);
    }
}