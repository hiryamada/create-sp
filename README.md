# Create new service principal

## Windows + Git Bash

Run the following command in Administrator's Windows PowerShell:

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hiryamada/create-sp/main/setup-git-bash.ps1'))
```

## Windows + Cygwin

Run the following command in Administrator's Windows PowerShell:

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hiryamada/create-sp/main/setup-cygwin.ps1'))
```

## macos

```
# todo
```
