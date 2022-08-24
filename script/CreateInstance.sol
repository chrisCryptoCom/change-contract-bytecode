// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Overwrite.sol";
import "../src/Addresses.sol";

contract CreateInstance is Test {
    Overwrite overwrite;
    uint256 salt;

    function setUp() public {
        overwrite = Overwrite(Addresses.overwrite);
        salt = 2;
    }

    function run() public {
        vm.startBroadcast();
        emit log_named_uint("Salt: ", salt);
        emit log_named_bytes("Code to deploy:", overwrite.getCode());
        address instance = overwrite.deploy(salt);
        emit log_named_address("Deployed address:", instance);
        vm.stopBroadcast();
    }
}
