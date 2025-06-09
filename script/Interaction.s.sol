// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

// This contract is used to interact with the BasicNft contract. Basically used to mint NFTs, check balances, etc.

contract MintBasicNft is Script {
    string public constant Token_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address recentDeployment = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(recentDeployment);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        // Ensure the contract address is valid
        require(contractAddress != address(0), "Invalid contract address");
        BasicNft(contractAddress).mintNft(Token_URI);
        vm.stopBroadcast();
    }
}
