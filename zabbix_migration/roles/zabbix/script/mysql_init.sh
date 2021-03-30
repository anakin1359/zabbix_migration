#!/bin/bash

# 新PWを定義
mysql_root_pw=Zabbix2020#

# DB作成, ユーザ追加
mysql -u root --password=$mysql_root_pw -e "
create database zabbix character set utf8 collate utf8_bin;
CREATE USER zabbix@localhost IDENTIFIED BY '$mysql_root_pw';
GRANT ALL ON zabbix.* TO zabbix@localhost;
flush privileges;
"
