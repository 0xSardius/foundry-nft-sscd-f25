// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        basicNft = new BasicNft();

        vm.stopBroadcast();
    }
}
