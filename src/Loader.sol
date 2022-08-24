// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Loader {

    address public implementation;

    function setImplementation(address _implementation) public {
        implementation = _implementation;
    }

    function getCode() public view returns (bytes memory) {
        return implementation.code;
    }
}
