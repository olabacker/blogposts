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



## Get total database size

```sql
SELECT 
    table_schema "DB Name", 
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
FROM information_schema.TABLES
GROUP BY table_schema;
```

The query will give you a table with the total size of each database on disk.

| DB Name | DB Size in MB |
|---------|--------------:|
| db1     |       10000.0 |
| db2     |        5000.0 |
| db3     |        2000.0 |



