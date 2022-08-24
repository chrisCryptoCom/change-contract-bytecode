// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Choice.sol";
import "./Loader.sol";


contract Overwrite {
    function create(address _loader, address _implementation, uint256 _salt) external returns(address){
        Loader(_loader).setImplementation(_implementation);
        bytes32 salt = bytes32(_salt);
        Choice d = new Choice{salt: salt}(_loader);
        return address(d);
    }
}
