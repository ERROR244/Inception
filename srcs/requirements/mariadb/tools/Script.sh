#!/bin/bash

/etc/init.d/mariadb start ;

sleep 0.5

mysql -u root << end
    CREATE DATABASE $MARIADB_DATABASE;
    CREATE USER '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
    GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER_NAME'@'%';
    FLUSH PRIVILEGES;
end

/etc/init.d/mariadb stop ;

sleep 0.5

mysqld_safe

cat /etc/mysql/mariadb.conf.d/50-server.cnf