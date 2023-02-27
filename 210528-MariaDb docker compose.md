Simple compose file for maria db.

```yml
version: '3.8'

services: 
  mariadb:
    image: mariadb:10.5
    command: --max_allowed_packet=512M --innodb_strict_mode=OFF --collation-server=latin1_swedish_ci --character-set-server=latin1
    volumes:
      - ./mariadb/sqldumps:/tmp/sqldumps/:rw
      - ./mariadb/volume:/var/lib/mysql
    environment: 
      - MYSQL_ROOT_PASSWORD=root
    ports:
      - "3306:3306"
```

