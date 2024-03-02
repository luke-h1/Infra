#!/bin/bash

# fix for public wifi popups not showing up
router_ip=$(route -n get default | grep 'gateway' | awk '{print $2}') && open "http://$router_ip"
