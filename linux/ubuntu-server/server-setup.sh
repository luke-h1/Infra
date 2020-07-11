#!/bin/bash
sudo apt-get install -y openssh* 
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb 
sudo apt install ./teamviewer_amd64.deb 
echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules
sudo ufw disable
sudo ufw enable
