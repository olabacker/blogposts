Small compilation of powershell commands | [pwsh]

## Shutdown

Restart or shutdown the computer with the following command 
```ps
shutdown -r/-s -t 0
```



## Updating powershell in powershell

This is probably easiest to do with winget!

```ps
winget install --id Microsoft.PowerShell --exact
```


## Managing services

Requires ps in administrator ⚡

```ps
Restart-Service [servicename]
```


## Toggle ethernet adapter

This script toggles the state of a specific ethernet adapter. Useful when regularly switching between network adapters for a vpn as an example.

```ps
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

```ps
cat [FileName]
```

## ls

Alias for Get-ChildItem

```ps
ls -Filter [SearchPattern]
```

## ni

Alias for New-Item

```ps
ni [FileName]
```


