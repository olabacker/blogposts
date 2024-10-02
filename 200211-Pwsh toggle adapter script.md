Toggle ethernet adapter | [pwsh]

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

