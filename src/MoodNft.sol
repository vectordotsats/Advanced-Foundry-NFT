// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private _tokenCounter;
    string private _sadSvg;
    string private _happySvg;

    constructor(
        string memory sadSvg,
        string memory happySvg
    ) ERC721("Mood NFT", "MOOD") {
        _tokenCounter = 0;
        _sadSvg = sadSvg;
        _happySvg = happySvg;
    }
}
