Guide to making windows terminal more useful and cooler looking 😎

# Install font

Install a nerd font, install it by opening and choosing install.

https://www.nerdfonts.com/font-downloads

# Install Powershell Core

Download and install Powershell Core.

https://github.com/PowerShell/PowerShell

# Install modules

Open powershell with administrative right and install the following modules.

```powershell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery

```

# Set $PROFILE

Open Powershell profile settings with 'code $PROFILE' and paste the following.

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme agnoster
Import-Module -Name Terminal-Icons

$env:POSH_GIT_ENABLED = $true

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineKeyHandler -Key Ctrl+d -Function KillLine
}
```

# Change font face

Open settings in Windows Terminal and set the font to the one you downloaded.

**CaskaydiaCove Nerd Font**

# The result

![alt text](images/result.png "Logo Title Text 1")