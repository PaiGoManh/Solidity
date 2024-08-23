// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyFirstname {
    string public firstname = "Rahul Sajeevan";

    function getfirstname() public view returns (string memory) {
        return firstname;
    }

    function setfirstname(string memory _fname) public  {
        firstname = _fname;
    }
}

contract MySecondname is MyFirstname {
    string public Secondname = "Rahul Sajeevan";

    function getSecondname() public view returns (string memory) {
        return Secondname;
    }

    function setSecondname(string memory _sname) public  {
        Secondname = _sname;
    }
}