// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private _tokenCounter;
    string private _sadSvgToImageURI;
    string private _happySvgToImageURI;

    constructor(
        string memory sadSvgToImageURI,
        string memory happySvgToImageURI
    ) ERC721("Mood NFT", "MOOD") {
        _tokenCounter = 0;
        _sadSvgToImageURI = sadSvgToImageURI;
        _happySvgToImageURI = happySvgToImageURI;
    }

    function mintSadNft() public {
        _safeMint(msg.sender, _tokenCounter);
        _tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory metadata = string.concat('{"name": '", name(), "'"}')
    }
}
