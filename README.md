# How to change deployed bytecode of a given contract
Example foundry project demonstrating how to change the bytecode of a deployed contract.
This example is heavily inspired by [this excellent talk](https://www.youtube.com/watch?v=QfFjUMPtsM0).

# How Does it work  ?

## Summary
The "trick" to change bytecode of a deployed contract consists of combining a `selfdestruct` call on the original implementation and then redeploying different bytecode to the same address using `CREATE2`.


## Required contracts
1. Contract whose constructor returns bytecode loaded from another contract, instead of its own compiled source code. [Choice.sol](src/Choice.sol)
2. Contract that can control the bytecode to be deployed in storage and creates an instance of above mentioned contract with `CREATE2`
3. Implementations that contain a `selfdestruct` call. ([ContractV1](src/ContractV1.sol),[ContractV2](src/ContractV2.sol))

## Transactions to execute
1. Deploy `Overwrite.sol` contract. ([DeployDependencies.sol](script/DeployDependencies.sol))
2. Call `Overwrite` contract and set the code to be deployed to the first version.([SetCode.sol](script/SetCode.sol))
3. Call `Overwrite` contract and deploy contract with given `salt` value. ([CreateInstance.sol](script/CreateInstance.sol))
4. Call selfdestruct method on the deployed instance ([DestroyInstance.sol](script/DestroyInstance.sol))
5. Repeat step 2 with the new bytecode
6. Repeat step 3 using the same `salt` value


# Getting started 
## Install Foundry
The best source of documentation is the [foundry-book](https://book.getfoundry.sh/) which contains chapters on all elements of the framework.

1. Install `foundryup` tool by running `curl -L https://foundry.paradigm.xyz | bash`
2. Install / Update foundry with `foundryup`

## Install dependencies
`forge install`

## Run tests
`forge test`


