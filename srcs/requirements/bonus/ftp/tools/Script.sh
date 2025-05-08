#!/bin/bash

mkdir -p /var/run/empty
chown root:root /var/run/empty
chmod 555 /var/run/empty
chmod 755 /var/run/vsftpd/data

useradd -m ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
chown -R ${FTP_USER}:${FTP_USER} /var/run/vsftpd/data

vsftpd /etc/vsftpd.conf
