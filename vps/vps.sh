#!/bin/bash 

curl -sSL https://get.docker.com | sh
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl enable docker-compose-app
sudo apt-get clean 
sudo apt-get autoremove  
sudo rm -r /var/lib/apt/lists/*
sudo reboot -h 0 