// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Choice.sol";


contract Overwrite {

    bytes code;

    function setCode(bytes memory _code) public {
        code = _code;
    }

    function getCode() public view returns (bytes memory) {
        return code;
    }

    function deploy(uint256 _salt) external returns(address) {
        bytes32 salt = bytes32(_salt);
        Choice d = new Choice{salt: salt}();
        return address(d);
    }
}
