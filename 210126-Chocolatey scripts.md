Delicious chocolatey scripts 🍫

<img style="" src="https://chocolatey.org/assets/images/global-shared/logo-square.svg" alt="drawing" width="150"/>

## New windows essential installation script!

Basic chocolatey script to install some applications quickly when refreshing a windows installation.


```powershell
# Check if Chocolatey is already installed
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    # Install Chocolatey if it is not already installed
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco feature enable -n allowGlobalConfirmation

choco install spotify 
choco install git
choco install vscode 
choco install steam 
choco install discord 
choco install gitkraken 
choco install slack 
```



Bitwarden
Dark reader
I don't care about cookies
uBlock origin
Stylus
Vimium