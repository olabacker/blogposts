Run local sql file in powershell | [pwsh]

```powershell
mysql -uroot -proot -e "source [filePath].sql" [dbname]
```