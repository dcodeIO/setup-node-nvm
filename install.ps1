Invoke-WebRequest -Uri https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-noinstall.zip -OutFile nvm.zip
Expand-Archive nvm.zip -DestinationPath .\mynvm
.\mynvm\nvm node_mirror $args[1]
.\mynvm\nvm install $args[0]
echo "SETUP_NODE_NVM_NVM: $((Get-Command .\mynvm\nvm).Path)"
echo "SETUP_NODE_NVM_NODE: $((Get-Command node).Path)"
echo "SETUP_NODE_NVM_NPM: $((Get-Command npm).Path)"
