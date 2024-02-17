//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//0xF50876b0c719c828aEfb87ECAECE1DadaaE7A3D4
contract LoCInventory is ERC721A, Ownable {

    uint256 constant MAX_SUPPLY = 100; 
    uint256 constant MAX_PER_WALLET = 10;
    string private baseTokenURI = "";

    constructor() ERC721A("Land of Chasers", "Chasers") {}

    function mint(uint256 quantity) external payable {
        require(_numberMinted(msg.sender) + quantity <= MAX_PER_WALLET, "Max amount minted");
        require(totalSupply() + quantity <= MAX_SUPPLY, "Max supply reached");

        _safeMint(msg.sender, quantity);
    }

    function updateURI(string calldata _URI) external onlyOwner{
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