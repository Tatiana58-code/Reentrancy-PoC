pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/VulnerableBank.sol";
import "../src/Attack.sol";

contract ReentrancyTest is Test {
    VulnerableBank public bank;
    Attack public attacker;
    
    function setUp() public {
        bank = new VulnerableBank();
        console.log("VulnerableBank address:", address(bank)); // <-- Здесь!
        attacker = new Attack(bank);
    }

    function testReentrancy() public {
        console.log("Initial bank balance:", address(bank).balance); 
        
        deal(address(attacker), 1 ether);
        vm.prank(address(attacker));
        attacker.attack();

        assertEq(
            address(bank).balance, 
            0, 
            "Bank balance should be 0 after attack"
        );
    }
}