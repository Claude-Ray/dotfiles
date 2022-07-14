#!/bin/bash

NODE_VERSION=$1

NVM_DIR=$HOME/.nvm

# Filter out the built-in packages: npm, corepack
NPM_GLOBAL_PACKAGES=$(npm ls -g --depth=0 -p | awk -F 'node_modules/' '{print $2}' | grep . | grep -vxF npm | grep -vxF corepack | tr '\n' ' ')

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install -b $NODE_VERSION

npm i -g $NPM_GLOBAL_PACKAGES

# Couldn't change the node version from the calling shell,
# but you can exec this command with function inside bash profile.

# nvm use $NODE_VERSION
