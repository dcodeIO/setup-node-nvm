$NVM_HOME="$((Get-Location).Path)\mynvm"
$env:NVM_HOME=$NVM_HOME
Invoke-WebRequest -Uri https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-noinstall.zip -OutFile nvm.zip
Expand-Archive nvm.zip -DestinationPath "$NVM_HOME"
New-Item -Path "$NVM_HOME\settings.txt" -ItemType File 
Invoke-Expression "$NVM_HOME\nvm.exe root $NVM_HOME"
Invoke-Expression "$NVM_HOME\nvm.exe node_mirror $args[1]"
Invoke-Expression "$NVM_HOME\nvm.exe install $args[0]"
Invoke-Expression "$NVM_HOME\nvm.exe use $args[0]"
echo "SETUP_NODE_NVM_NVM: $NVM_HOME\nvm.exe"
echo "SETUP_NODE_NVM_NODE: $((Get-Command node).Path)"
echo "SETUP_NODE_NVM_NPM: $((Get-Command npm).Path)"
