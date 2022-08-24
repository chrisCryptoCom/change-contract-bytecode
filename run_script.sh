SCRIPT_NAME=$1 # save positional arg
forge script ${SCRIPT_NAME}.sol:${SCRIPT_NAME} --private-key=$PRIVATE_KEY --fork-url=$FORK_URL $@
