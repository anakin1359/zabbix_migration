#!/bin/bash

# MySQLの初期PWを取得
int_pw=$(grep "A temporary password is generated for root@localhost:" /var/log/mysqld.log | awk '{ print $13}')

# 新PWを定義
mysql_root_pw=Zabbix2020#

expect -c '
    set timeout 10;
    spawn mysql_secure_installation;
    expect "Enter password for user root:";
    send "'"${int_pw}"'\n";
    expect "New password:";
    send "'"${mysql_root_pw}"'\n";
    expect "Re-enter new password:";
    send "'"${mysql_root_pw}"'\n";
    expect "Change the password for root ?";
    send "n\n";
    expect "Remove anonymous users?";
    send "y\n";
    expect "Disallow root login remotely?";
    send "y\n";
    expect "Remove test database and access to it?";
    send "y\n";
    expect "Reload privilege tables now?";
    send "y\n";
    interact;'
