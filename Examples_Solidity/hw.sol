// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Helloworld{
    uint data = 90; 

    function get() public view returns (uint) {
        return (data);
    }

    function set(uint _data) public {
        data = _data;
    }
}