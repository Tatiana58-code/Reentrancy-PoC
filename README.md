# Reentrancy-PoC
## 📌 Vulnerability Description
The `VulnerableBank.sol` contract contains a classic reentrancy vulnerability in the `withdraw()` function. Violation of the CEI (Checks-Effects-Interactions) pattern allows an attacker to recursively withdraw funds until the contract is completely empty.
## 🚀 Reproducing the attack

### Requirements
- Installed [Foundry](https://getfoundry.sh) forge Version: 1.2.2-v1.2.2
- Solidity version: `^0.8.30`
- Running the test:forge test --match-test testReentrancy -vvvv
## 🛡️ How to Fix
### 1. CEI Pattern
```solidity
function withdraw() public {
    uint balance = balances[msg.sender];
    balances[msg.sender] = 0; // Effects first
    (bool success, ) = msg.sender.call{value: balance}(""); // Interaction last
    require(success, "Transfer failed");
