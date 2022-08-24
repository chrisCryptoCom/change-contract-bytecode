// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Loader {

    address public implementation;
    bytes implementationCode;

    function setImplementation(address _implementation) public {
        implementation = _implementation;
        implementationCode = implementation.code;
    }

    function setCode(bytes memory _code) public {
        implementationCode = _code;
    }

    function getCode() public view returns (bytes memory) {
        return implementationCode;
    }
}
