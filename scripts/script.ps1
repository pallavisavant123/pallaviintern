# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$gitSecretOutput = git secrets 2>&1 | Select-Object -First 1

$installed = $gitSecretOutput -match "^usage"

Write-Host $installed

$networkPath = "\\ITU-IISDEV-D02\Websites\git-secrets-master"
$repoPath = Get-Location




if (-Not $installed){

    # if (Test-Path $networkPath){
    #     Write-Host "Not installed"
#         Copy-Item -Path $networkPath -Destination $repoPath -Recurse -Force
#         cd .\git-secrets-master
#         Start-Process -FilePath "C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe" -ArgumentList ".\install.ps1" -Wait -NoNewWindow
#         cd ..
#         Remove-Item -Recurse -Force "git-secrets-master"
    # }
#     # else{
        git config --global http.sslBackend schannel

        git clone https://github.com/awslabs/git-secrets.git "git-secrets-master"
        Write-Host $repoPath
        cd .\git-secrets-master
        $repoPath = Get-Location
        Write-Host $repoPath
        Start-Process -FilePath "C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe" -ArgumentList ".\install.ps1" -Wait -NoNewWindow
        cd ..
        $repoPath = Get-Location
        Write-Host $repoPath
        Remove-Item -Recurse -Force "git-secrets-master"


#     # }

    $gitSecretOutput = git secrets 2>&1 | Select-Object -First 1


    $installed = $gitSecretOutput -match "^usage"

    Write-Host $installed


#     if (-Not $installed){
#         Write-Host "git-secrets installation failed."
#         exit 1
#     }
}

git secrets --install

# Write-Host "Completed"
