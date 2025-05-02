FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/50-server.cnf   /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/Script.sh       /usr/local/bin/

RUN chmod +x /usr/local/bin/Script.sh

EXPOSE 3306

CMD ["bash", "/usr/local/bin/Script.sh"]

