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


    // From https://github.com/ethereum/solidity-examples/blob/master/src/unsafe/Memory.sol
    // Size of a word, in bytes.
    uint internal constant WORD_SIZE = 32;

    function dataPtr(bytes memory bts) internal pure returns (uint addr) {
        assembly {
            addr := add(bts, /*BYTES_HEADER_SIZE*/32)
        }
    }

}
