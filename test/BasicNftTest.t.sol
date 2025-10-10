// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployBasicNft;
    BasicNft public basicNft;
    address public USER = makeAddr("USER");

    function setUp() public {
        deployBasicNft = new DeployBasicNft();
        basicNft = deployBasicNft.run();
    }

    function testNftNameIsCorrect() public {
        assertEq(basicNft.name(), "Doggie");
    }

    function testNftSymbolIsCorrect() public {
        assertEq(basicNft.symbol(), "DOG");
    }

    function canMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");
        assertEq(basicNft.balanceOf(USER), 1);

    }

    function testMintNft() public {
        string memory tokenURI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
        vm.prank(USER);
        basicNft.mintNft(tokenURI);
        assertEq(basicNft.balanceOf(USER), 1);
        assertEq(basicNft.ownerOf(0), USER);
        assertEq(basicNft.tokenURI(0), tokenURI);
    }
}
