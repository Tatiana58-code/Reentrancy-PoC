# Reentrancy-PoC
## 📌 Vulnerability Description
The `VulnerableBank.sol` contract contains a classic reentrancy vulnerability in the `withdraw()` function. Violation of the CEI (Checks-Effects-Interactions) pattern allows an attacker to recursively withdraw funds until the contract is completely empty.
## 🚀 Reproducing the attack

### Requirements
- Installed [Foundry](https://getfoundry.sh) forge Version: 1.2.2-v1.2.2
- Solidity version: `^0.8.30`
- Running the test:forge test --match-test testReentrancy -vvvv
