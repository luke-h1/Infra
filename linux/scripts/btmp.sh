#!/bin/bash

if [ -d /root/log/ ]; 
then

last -f /var/log/btmp >> /root/log/login_attempts.txt

elif 
	[ ! -d /root/log ]; then
	mkdir /root/log && last -f /var/log/btmp >> /root/log/login_attempts.txt
fi 
