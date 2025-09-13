// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {EASDemo} from "../src/EASDemo.sol";

contract EASDemoTest is Test {
    EASDemo public easDemo;
    
    function setUp() public {
        // Fork Scroll Sepolia testnet
        uint256 forkId = vm.createFork("https://sepolia-rpc.scroll.io");
        vm.selectFork(forkId);
        
        // Deploy the EASDemo contract
        easDemo = new EASDemo();
    }
    
    function test_SendIsFriendCall() public {
        // Test calling the sendIsFriend function
        address testRecipient = address(0x1234);
        bool isFriend = true;
        
        // Fund the caller
        vm.deal(address(this), 1 ether);
        
        // Call the function
        bytes32 result = easDemo.sendIsFriend(testRecipient, isFriend);
        
        // Verify we got a result (attestation UID)
        assertTrue(result != bytes32(0), "Should return a valid attestation UID");
        // console.log("Attestation UID:", result);
    }
}