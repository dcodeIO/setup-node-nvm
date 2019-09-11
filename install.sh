#!/bin/bash
set -e
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
export NVM_NODEJS_ORG_MIRROR="$2"
chmod +x "$NVM_DIR/nvm.sh"
"$NVM_DIR/nvm.sh" --no-use
nvm install $1
nvm use $1
npm -g install npm
echo "SETUP_NODE_NVM_NODE: $(which node)"
echo "SETUP_NODE_NVM_NPM: $(which npm)"
