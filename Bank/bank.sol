// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
// mapping(type of key=>type of value) mappingName

contract BankContract{
    uint public count;
    mapping (address=>uint)public balanceLedger;
    mapping (uint=>address)public addressCount;    //for counting the accounts in the bank
    address public admin;
    constructor(){
        admin=msg.sender;
    }
    modifier onlyAdmin{
        require(msg.sender==admin,"Unautherized");
        _;
    }
    function deposit()public payable {
        if(balanceLedger[msg.sender]==0){
            addressCount[++count]=msg.sender;
        }
        balanceLedger[msg.sender]+=msg.value;

    }
    modifier balanceCheck(uint amt){
        require(balanceLedger[msg.sender]>=amt,"Insufficient Balance");
        _;
    }
    function withdraw(uint amt) public balanceCheck(amt){
        // require(balanceLedger[msg.sender]>=amt,"Insufficient Balance");
        balanceLedger[msg.sender]-=amt;
        payable (msg.sender).transfer(amt);
    }
    function transfer(address add,uint val) public balanceCheck(val) {
        // require(balanceLedger[msg.sender]>val,"Insufficient Balance");
          balanceLedger[msg.sender]-=val;
        payable (add).transfer(val);

    }
    function monitorBalance()public view onlyAdmin  returns  (address,uint){
        uint maxBalance;
        address maxAddress;
        for(uint i=1;i<=count;i++){
           
            if(maxBalance<balanceLedger[addressCount[i]]){
                 maxAddress=addressCount[i];
                maxBalance=balanceLedger[maxAddress];
            }
        }
        return (maxAddress,maxBalance);
    }

    function deleteAccount() public view {
        if(balanceLedger[msg.sender]>0){

        }
        
    }




    
}