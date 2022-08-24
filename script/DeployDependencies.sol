// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractV1.sol";
import "../src/ContractV2.sol";
import "../src/Loader.sol";
import "../src/Overwrite.sol";

contract DeployDependencies is Test {

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        ContractV1 v1 = new ContractV1();
        emit log_named_address("ContractV1: ", address(v1));
        ContractV2 v2 = new ContractV2();
        emit log_named_address("ContractV2: ", address(v2));
        Loader loader = new Loader();
        emit log_named_address("Loader: ", address(loader));
        Overwrite overwrite = new Overwrite();
        emit log_named_address("Overwrite: ", address(overwrite));
    }
}
