// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Cert{

    struct certificate{
        string name;
        string course;
        string grade;
        string date;
    }

    mapping (uint=>certificate) public certificates;

}