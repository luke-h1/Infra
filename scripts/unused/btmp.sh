#!/bin/bash

last -f /var/log/btmp >> /root/log/login_attempts.txt 
