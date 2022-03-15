small compilation of powershell commands

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


