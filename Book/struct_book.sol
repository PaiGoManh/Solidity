// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Books{

    struct MyBook {
        string title;
        uint price;
        address owner;
        bool sold;
    }

    MyBook public Book1;

    address [] public buyers;

    function setBook (string memory x,uint y) public {
        Book1.title = x;
        Book1.price = y;
    }

    function getBook () public view returns (string memory,uint) {
        return (Book1.title,Book1.price);
    }

    function toWei(uint amt) public pure returns(uint) {
        return (amt*1000000000000000000);
    }

    function buyBook () public payable  {
        require(toWei(Book1.price)<=msg.value,"book price is not correct, insufficient value");
            buyers.push(Book1.owner);
            Book1.sold=true;
            uint bal = msg.value - toWei(Book1.price);
            if(bal>0){
                payable (msg.sender).transfer(bal);
            }

        // }
    }

    function buyersCount() public view returns(uint){
        return (buyers.length);
    }

}