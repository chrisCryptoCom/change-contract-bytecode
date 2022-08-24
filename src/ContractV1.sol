// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ContractV1 {
    function version() external returns(uint256) {
        return 1;
    }

    function destroy() external {
        selfdestruct(payable(address(0)));
    }
}
