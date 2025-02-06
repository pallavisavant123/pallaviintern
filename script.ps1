$gitSecretOutput = git secrets 2>&1 | Select-Object -First 1

$installed = $gitSecretOutput -match "^usage"

Write-Host $installed

if (-Not $installed){

    cd .\git-secrets-master
    .\install.ps1
    cd..
    cd..

    if (-Not $installed){
        Write-Host "git-secrets installation failed."
        exit 1
    }
}

git secrets --install
git secrets --add "forbidden"

Write-Host "Completed"
# Write-Host $gitSecretsInstall
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# git clone https://github.com/awslab/git-secrets.git "$env:TEMP\git-secrets"
# Set-Location "$env:TEMP\git-secrets"
# .\install.ps1
# Set-Location $HOME
# Remove-Item -Recurse -Force "$env:TEMP\git-secrets"