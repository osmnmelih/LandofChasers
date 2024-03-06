//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//0x964D3aEcaCdE6561f998F2f262c9B170b5d8D0B0
contract LoCInventory is ERC721A, Ownable {

    string private baseTokenURI = "";

    constructor() ERC721A("Land of Chasers Inventory", "LoC-Inventory") Ownable(msg.sender) {}

    function mint(uint256 quantity) external payable onlyOwner {
        _safeMint(msg.sender, quantity);
    }

    function updateURI(string calldata _URI) external onlyOwner {
        baseTokenURI = _URI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) revert URIQueryForNonexistentToken();
        string memory metadataPointerId;
        string memory baseURI = _baseURI();

        metadataPointerId = _toString(tokenId + 1);
        string memory result = string(abi.encodePacked(baseURI, metadataPointerId, ".json"));

        return bytes(baseURI).length != 0 ? result : "";
    }
}