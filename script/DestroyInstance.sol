// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractV1.sol";
import "./Addresses.sol";

contract DestroyInstance is Test {
    ContractV1 instance;

    function setUp() public {
        instance = ContractV1(Addresses.instance);
    }

    function run() public {
        vm.startBroadcast();
        instance.destroy();
        vm.stopBroadcast();
    }
}
