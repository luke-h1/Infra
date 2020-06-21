#!/bin/bash

#simple script to monitor temperatures (output from lm_sensors) 


sensors | grep "Package id 0:" >> /root/temperature.log 


