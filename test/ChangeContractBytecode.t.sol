// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractV1.sol";
import "../src/ContractV2.sol";
import "../src/Overwrite.sol";

contract BaseTest is Test {
    ContractV1 instance;
    ContractV1 firstImplementation;
    ContractV2 secondImplementation;
    Overwrite overwrite;
    uint256 salt;

    function setUp() public virtual {
        salt = 0;
        firstImplementation = new ContractV1();
        secondImplementation = new ContractV2();
        overwrite = new Overwrite();
        overwrite.setCode(type(ContractV1).runtimeCode);
        instance = ContractV1(overwrite.deploy(salt));
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
        overwrite.setCode(type(ContractV2).runtimeCode);
    }

    function testCorrectVersionAfterChange() public {
        overwrite.deploy(salt);
        uint256 versionAfter = instance.version();
        emit log_named_uint("Version after:", versionAfter);
        assertEq(versionAfter, 2);
    }
}
