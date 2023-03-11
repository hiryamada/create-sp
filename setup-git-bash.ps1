# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# make refreshenv work
# https://gitlab.com/gitlab-org/ci-cd/shared-runners/images/gcp/windows-containers/-/issues/13

Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
refreshenv

# install required software
choco install -y git azure-cli jq

# log in to Azure
refreshenv
az login

# create new sp
& "C:\Program Files\Git\bin\bash.exe" --login -i -c 'curl https://raw.githubusercontent.com/hiryamada/create-sp/main/create-sp.sh |bash'

# load sp in .bashrc
& "C:\Program Files\Git\bin\bash.exe" --login -i -c 'curl https://raw.githubusercontent.com/hiryamada/create-sp/main/load-env-in-bashrc.sh |bash'
