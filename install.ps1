$NVM_HOME="$((Get-Location).Path)\mynvm"
Invoke-WebRequest -Uri https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-noinstall.zip -OutFile nvm.zip
Expand-Archive nvm.zip -DestinationPath "$NVM_HOME"
New-Item -Path "$NVM_HOME\settings.txt" -ItemType File 
setx PATH "$NVM_HOME;$env:path" -m
nvm root $NVM_HOME
nvm node_mirror $args[1]
nvm install $args[0]
nvm use $args[0]
echo "SETUP_NODE_NVM_NVM: $((Get-Command nvm).Path)"
echo "SETUP_NODE_NVM_NODE: $((Get-Command node).Path)"
echo "SETUP_NODE_NVM_NPM: $((Get-Command npm).Path)"
