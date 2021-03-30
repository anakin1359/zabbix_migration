#!/bin/bash

# 新PWを定義
mysql_root_pw=Zabbix2020#

# zabbix zabbix バージョン情報の取得
zabbix_version=`find /usr/share/doc/ -name "zabbix-server-mysql*"`

# DB読み込み
zcat $zabbix_version/create.sql.gz | mysql -u zabbix --password=$mysql_root_pw zabbix
