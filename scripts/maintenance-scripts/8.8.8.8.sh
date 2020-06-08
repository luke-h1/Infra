#!/bin/bash

isinfile=$(cat /etc/resolv.conf | grep -c "nameserver 8.8.8.8") 

if [ $isinfile -eq 0 ];
	then
		echo "string not in file" >> /root/log/nameserver.log  
		echo "nameserver 8.8.8.8" >> /etc/resolv.conf
                echo "nameserver 8.8.4.4" >> /etc/resolv.conf 
	else
		echo "string in file" >> /root/log/nameserver.log 
fi 
