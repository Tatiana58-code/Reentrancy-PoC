// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/console.sol";

contract VulnerableBank {
    mapping(address => uint) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        console.log("Deposit for:", msg.sender); 
    }

    function withdraw() external {
        uint amount = balances[msg.sender];
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
        balances[msg.sender] = 0;
    }

    receive() external payable {}
}