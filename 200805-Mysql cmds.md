Run local sql file in powershell | [pwsh]

```ps
mysql -uroot -proot -e "source [filePath].sql" [dbname]
```