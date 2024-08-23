// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Cert{

    struct certificate{
        string name;
        string course;
        string grade;
        string date;
    }
    address public admin;

    constructor(){
        admin = msg.sender;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin,"Unauthorised");
        _;
    }

    mapping (uint=>certificate) public certificates;

    function issue(uint _id,string memory _name,string memory _course,string memory _grade,string memory _date) public onlyAdmin{   
        certificates[_id] = certificate(_name,_course,_grade,_date);
    }



}