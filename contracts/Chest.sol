//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

interface IERC20 {
    function mintXPInventory(address to, uint256 quantity) external;
}

//More functionalities will be added to the Chest contract such as withdrawing the NFTs.
//0x5dBe3d12a3d1D088BD7A4804E68BBa1940855100
contract ChestLoC is IERC721Receiver {
    address public xpTokenAddress;
    address public inventoryAddress;

    constructor(address _xpAddress, address _inventoryAddress) {
        xpTokenAddress = _xpAddress;
        inventoryAddress = _inventoryAddress;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes memory data
    ) public virtual override returns (bytes4) {
        // Mint XP tokens when an NFT is transferred to this contract
        // Assume 100 XPs are minted for each NFT received
        require(msg.sender == inventoryAddress, "NFT not eligible.");
        IERC20(xpTokenAddress).mintXPInventory(from, 100 * 10**18);
        return this.onERC721Received.selector;
    }

}