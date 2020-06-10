#!/bin/bash


for table in $(echo "show tables;" | mysql -p zabbix); do echo "ALTER TABLE $table CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin;" | mysql -p zabbix ; done

