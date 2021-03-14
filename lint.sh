#!/bin/bash
sudo apt-get install -y pip 
pip install ansible-lint 
ansible-lint macbook/mac-catalina.yml -x 303,701,601,206,602,403,301,502,306,208,201 -v


