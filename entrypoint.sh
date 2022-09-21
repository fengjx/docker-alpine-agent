#!/bin/sh

pwd=${pwd:-docker}
echo "root password: ${pwd}"
echo "root:${pwd}" | chpasswd

ssh-keygen -A
/usr/sbin/sshd -D -e
