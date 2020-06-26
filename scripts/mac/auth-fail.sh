#!/bin/bash

log stream --predicate '(eventMessage CONTAINS "Authentication failed")' --style syslog
Filtering the log data using "composedMessage CONTAINS "Authentication failed"" >> /root/auth-log.txt
