// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//0x8b9B061e386D460683f0CC137FFD03f28229365E
contract LoCXP is ERC20, Ownable {
    address public CHEST;

    constructor() ERC20("Land of Chasers XP", "LoC-XP") Ownable(msg.sender) {}

    function mintXPInventory(address _to, uint256 _amount) external {
        require(msg.sender == CHEST, "Not authorized.");
        _mint(_to, _amount);
    }

    function mintXPKill(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function updateChestAddress(address chestAddr) external onlyOwner {
        CHEST = chestAddr;
    }
}