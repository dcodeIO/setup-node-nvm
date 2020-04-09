#!/bin/bash
set -e
nvm install "$1"
echo "SETUP_NODE_NVM_NVM: $(which nvm)"
echo "SETUP_NODE_NVM_NODE: $(which node)"
echo "SETUP_NODE_NVM_NPM: $(which npm)"
