// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ContractV2 {
    function version() external returns(uint256) {
        return 2;
    }

    function destroy() external {
        selfdestruct(payable(address(0)));
    }
}
