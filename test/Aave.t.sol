// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Aave} from "../src/Aave.sol";

contract AaveTest is Test {
    Aave public aave;

    // Aave addresses on Scroll Sepolia
    address public constant AAVE_POOL_ADDRESS = 0x48914C788295b5db23aF2b5F0B3BE775C4eA9440;
    address public constant DAI_ADDRESS = 0x7984E363c38b590bB4CA35aEd5133Ef2c6619C40;

    function setUp() public {
        // Fork Scroll Sepolia testnet
        uint256 forkId = vm.createFork("https://sepolia-rpc.scroll.io");
        vm.selectFork(forkId);

        // Deploy the Aave contract
        aave = new Aave(AAVE_POOL_ADDRESS, DAI_ADDRESS);
    }

    function test_GetReserveData() public view {
        // Test calling the getReserveData function through the Aave contract
        // This tests that we can interact with the Aave pool contract
        address aTokenAddress = aave.ATOKEN_ADDRESS();
        
        // Verify we got a valid aToken address
        assertTrue(aTokenAddress != address(0), "Should return a valid aToken address");
        // console.log("aToken address:", aTokenAddress);
    }
}

