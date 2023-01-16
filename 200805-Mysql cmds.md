Useful mysql commands | [mysql]

## Run local sql file in powershell

```powershell
mysql -uroot -proot -e "source [filePath].sql" [dbname]
```


## Get individual table sizes of database

Make sure to replace `*DATABASE*` with your own database name and run the following query.

```sql
SELECT 
    table_name AS 'Table', 
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS 'Size (MB)'
FROM information_schema.TABLES 
WHERE table_schema = '*DATABASE*'
ORDER BY (data_length + index_length) DESC;
```

The query will give you an ordered table with respective tables size on disk.

| Table                                                            | Size (MB) |
|------------------------------------------------------------------|----------:|
| logs                                                             |  63101.97 |
| data                                                             |  19708.97 |
| misc                                                             |   9786.66 |



