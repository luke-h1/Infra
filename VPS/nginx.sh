#!/bin/bash

# Simple script to get a basic nginx server up and running 


# install deps & setup firewall 
sudo apt-get update -y && curl -sL https://deb.nodesource.com/setup_14.x | bash - && sudo apt-get install -y nodejs && npm i -g pm2 && pm2 startup ubuntu && sudo ufw enable && sudo ufw allow ssh && ufw allow https && ufw reload && ufw status && sudo apt-get install -y nginx


# edit nginx config 
# sudo vim /etc/nginx/sites-available/default 
# after done editing config run sudo nginx -t && sudo service nginx restart 


# Install certbot 
sudo apt-get update -y && sudo apt-get install -y snapd && sudo snap install snap-store && sudo snap install rtbot --classic
# sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com