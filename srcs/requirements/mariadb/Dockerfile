FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY Script.sh /usr/local/bin/Script.sh
RUN chmod +x /usr/local/bin/Script.sh

EXPOSE 3306

CMD ["Script.sh"]
