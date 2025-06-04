// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {BasicNft} from "../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract TestBasicNft is Test {
    BasicNft public basicNft;
    DeployBasicNft public deployer;
    string public constant Token_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "SPIKY";
        string memory actualName = basicNft.name();
        assertEq(
            keccak256(abi.encodePacked(actualName)),
            keccak256(abi.encodePacked(expectedName))
        );
    }

    function testSymbolIsCorrect() public view {
        string memory expectedSymbol = "SPK";
        string memory actualSymbol = basicNft.symbol();
        assertEq(
            keccak256(abi.encodePacked(actualSymbol)),
            keccak256(abi.encodePacked(expectedSymbol))
        );
    }

    function testIfMintingChangesBalance() public {
        vm.prank(USER);
        basicNft.mintNft(Token_URI);

        assertEq(basicNft.balanceOf(USER), 1);
        assertEq(
            keccak256(abi.encodePacked(basicNft.tokenURI(0))),
            keccak256(abi.encodePacked(Token_URI))
        );
    }
}
