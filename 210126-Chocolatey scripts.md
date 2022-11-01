Delicious chocolatey scripts 🍫

<img style="" src="https://chocolatey.org/assets/images/global-shared/logo-square.svg" alt="drawing" width="150"/>

## New windows essential installation script!

Basic chocolatey script to install some applications quickly when refreshing a windows installation.

```powershell
choco feature enable -n allowGlobalConfirmation

choco install spotify 
choco install vscode 
choco install steam 
choco install discord 
choco install gitkraken 
choco install 7zip 
choco install slack 

choco feature disable -n allowGlobalConfirmation
```
