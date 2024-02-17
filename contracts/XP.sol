// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LoCXP is ERC20, Ownable {
    address public CHEST;

    constructor() ERC20("Land of Chasers XP", "LoC-XP") {}

    function mint(address to, uint256 amount) public {
        require(msg.sender == CHEST, "Not authorized.");
        _mint(to, amount);
    }

    function updateChestAddress(address chestAddr) external onlyOwner {
        CHEST = chestAddr;
    }
}