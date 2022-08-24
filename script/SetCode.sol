// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractV1.sol";
import "../src/ContractV2.sol";
import "../src/Overwrite.sol";
import "../src/Addresses.sol";

contract SetCode is Test {
    Overwrite overwrite;
    bytes codeToDeploy;

    function setUp() public {
        overwrite = Overwrite(Addresses.overwrite);
        codeToDeploy = type(ContractV2).runtimeCode;
    }

    function run() public {
        vm.startBroadcast();
        emit log_named_bytes("Code to deploy:", codeToDeploy);
        overwrite.setCode(codeToDeploy);
        vm.stopBroadcast();
    }
}
