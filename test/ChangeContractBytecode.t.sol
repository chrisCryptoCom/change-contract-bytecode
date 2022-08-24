// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractV1.sol";
import "../src/ContractV2.sol";
import "../src/Loader.sol";
import "../src/Overwrite.sol";

contract BaseTest is Test {
    ContractV1 instance;
    ContractV1 firstImplementation;
    ContractV2 secondImplementation;
    Loader loader;
    Overwrite overwrite;

    function setUp() public virtual {
        firstImplementation = new ContractV1();
        secondImplementation = new ContractV2();
        loader = new Loader();
        overwrite = new Overwrite();
        instance = ContractV1(overwrite.create(address(loader), address(firstImplementation), 0));
    }

}

contract BeforeChange is BaseTest {
    function testCorrectVersionBeforeChange() public {
        emit log_named_address("Deployed address:", address(instance));
        uint256 versionBefore = instance.version();
        emit log_named_uint("Version before:", versionBefore);
        assertEq(versionBefore, 1);
    }
}

contract AfterChange is BaseTest {
    function setUp() public override {
        super.setUp();
        instance.destroy();
    }

    function testCorrectVersionAfterChange() public {
        overwrite.create(address(loader), address(secondImplementation), 0);
        uint256 versionAfter = instance.version();
        emit log_named_uint("Version after:", versionAfter);
        assertEq(versionAfter, 2);
    }
}
