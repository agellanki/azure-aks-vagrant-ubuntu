#!/bin/bash
apt-get install figlet

cat >>/etc/hosts<<EOF
$1  $2  $3
EOF

figlet utilities
apt-get install curl git nano wget systemd > /dev/null 2>&1

figlet SSH
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

