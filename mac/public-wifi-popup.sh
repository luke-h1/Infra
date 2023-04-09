#!/bin/bash
router_ip=$(route -n get default | grep 'gateway' | awk '{print $2}') && open "http://$router_ip"
