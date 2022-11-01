Small compilation of powershell commands | [pwsh]

## Shutdown

Restart or shutdown the computer with the following command 
```sh
shutdown -r/-s -t 0
```

Reboot directly into bios
```sh
shutdown -r -fw -f -t 0
```


## Copy output

```
[any command giving output] | clip 
```

## Search output

```sh
[any command giving output] | searchstr [query] 
```

## Updating powershell in powershell

This is probably easiest to do with winget!

```sh
winget install --id Microsoft.PowerShell --exact
```


## Managing services

Requires ps in administrator ⚡

```powershell
Restart-Service [servicename]
```


## Toggle ethernet adapter

This script toggles the state of a specific ethernet adapter. Useful when regularly switching between network adapters for a vpn as an example.

```powershell
$adapterName = 'Ethernet'

$status = Get-NetAdapter -Name $adapterName | Format-List -Property "Status" | Out-String

if ($status -Match 'Disabled') {
    Enable-NetAdapter -Name $adapterName -Confirm:$false
    Write-Host "Adapter " -NoNewline
    Write-Host "enabled" -ForegroundColor Green -NoNewline
} else {
    Disable-NetAdapter -Name $adapterName -Confirm:$false
    Write-Host "Adapter " -NoNewline
    Write-Host "disabled" -ForegroundColor Red -NoNewline
}
```


## cat 😸

Alias for Get-Content

```sh
cat [FileName]
```

## ls

Alias for Get-ChildItem

```sh
ls -Filter [SearchPattern]
```

## ni

Alias for New-Item

```sh
ni [FileName]
```


