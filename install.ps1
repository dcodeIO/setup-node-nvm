$NVM_HOME="$((Get-Location).Path)\mynvm"
$env:NVM_HOME=$NVM_HOME
$env:NVM_PATH=$NVM_HOME
$env:NVM_SYMLINK="$NVM_HOME\nodejs"
$env:PATH=$env:PATH + ";$NVM_HOME"
Invoke-WebRequest -Uri https://github.com/coreybutler/nvm-windows/releases/download/1.1.10/nvm-noinstall.zip -OutFile nvm.zip
Expand-Archive nvm.zip -DestinationPath "$NVM_HOME"
New-Item -Path "$NVM_HOME\settings.txt" -ItemType File 
nvm.exe root $NVM_HOME
nvm.exe node_mirror $args[1]
nvm.exe install $args[0]
nvm.exe use $args[0]
echo "SETUP_NODE_NVM_NVM: $NVM_HOME"
echo "SETUP_NODE_NVM_NODE: $NVM_HOME\nodejs\node.exe"
echo "SETUP_NODE_NVM_NPM: $NVM_HOME\nodejs\npm.cmd"
