Guide to making windows terminal more useful and cooler looking 😎

# Install font

[Download a nerd font](https://www.nerdfonts.com/font-downloads), install it by opening and choosing install.


# Install Powershell Core

[Download and install Powershell Core](https://github.com/PowerShell/PowerShell).

# Install oh-my-posh

Install [oh-my-posh from the Microsoft Store](https://apps.microsoft.com/store/detail/XP8K0HKJFRXGCK)

To customize your oh-my-posh theme it is a good starting point to look at existing themes with `Get-PoshThemes` command. Consider placing the configuration in a git repository, that way you can synchronize the configuration between machines.

# Install modules

Open powershell with administrative rights and install the following modules.

```powershell
Install-Module posh-git -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery
```

# Set $PROFILE

Open Powershell profile settings with 'code $PROFILE' and paste the following.

```powershell
function Run-Step([string] $Description, [ScriptBlock]$script)
{
  Write-Host  -NoNewline "Loading " $Description.PadRight(20)
  & $script
  Write-Host "`u{2705}" # checkmark emoji
}

Run-Step "Posh-Git" {
    Import-Module posh-git
    $env:POSH_GIT_ENABLED = $true
  }

Run-Step "oh-my-posh" {
    oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/olabacker/ohmyposh/master/config.json' | Invoke-Expression
  }

Run-Step "terminal-icons" {
    Import-Module -Name Terminal-Icons
}


if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineKeyHandler -Key Ctrl+d -Function KillLine
}

function pjson ($jsonfile) {
    (get-content $jsonfile) | convertfrom-json | convertto-json -depth 100 | 
    set-content $jsonfile
}
```

# Change font face

Open settings in Windows Terminal and set the font to the one you downloaded.

I use `CaskaydiaCove Nerd Font` myself.

# Result

![alt text](images/result.png "Logo Title Text 1")

