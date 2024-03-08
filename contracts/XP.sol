// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//0x8C9825d7fA0811b60D0Ca244B2AEad630846EF05
contract LoCXP is ERC20, Ownable {

    constructor() ERC20("Land of Chasers XP", "LoC-XP") Ownable(msg.sender) {}

    function mintXP(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }
}