// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "Inheritance/samecontract.sol";

contract Myplace is MySecondname {
    string public place = "Ernakulam";

    function get() public view returns (string memory) {
        return place;
    }

    function set(string memory _name) public  {
        place = _name;
    }
}