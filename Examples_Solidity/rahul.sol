// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract myname {
    string public name = "Rahul Sajeevan";

    function get() public view returns (string memory) {
        return name;
    }

    function set(string memory _name) public  {
        name = _name;
    }
}