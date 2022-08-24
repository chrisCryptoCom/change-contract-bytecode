// Source: https://github.com/drinkcoffee/EthEngGroupSolidityExamples/blob/master/security/contracts/Choice.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.8 <0.9.0;

import "./Overwrite.sol";

contract Choice {
    constructor() {
        Overwrite overwrite = Overwrite(msg.sender);
        bytes memory code = overwrite.getCode();

        uint256 memOfs = dataPtr(code);
        uint256 len = code.length;

        assembly {
            return(memOfs, len)
        }
    }

    // Returns a pointer to the memory address of the data in given bytes array
    function dataPtr(bytes memory bts) internal pure returns (uint addr) {
        assembly {
            // Byte arrays are stored in memory with a 32 byte header containing length etc.
            // The actual data starts after that header so we have to skip it
            addr := add(bts, /*BYTES_HEADER_SIZE*/32)
        }
    }
}
