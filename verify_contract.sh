CONTRACT_NAME=$1 # save positional arg
echo "ContractName $CONTRACT_NAME"
CONTRACT_ADDRESS=$2 # save positional arg
echo "ContractAddress $CONTRACT_ADDRESS"
forge verify-contract --chain-id 338 --num-of-optimizations 200 --compiler-version v0.8.15 $CONTRACT_ADDRESS src/$CONTRACT_NAME.sol:$CONTRACT_NAME $ETHERSCAN_API_KEY

