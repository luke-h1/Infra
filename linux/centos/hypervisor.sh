#!/bin/bash
echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
sudo yum install software-properties-common apt-transport-https wget -y 
sudo yum install epel-release
sudo rpm --import  https://dl.tvcdn.de/download/linux/signature/TeamViewer2017.asc 
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo yum localinstall -y ./teamviewer.x86_64.rpm
echo "Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
" >> /etc/ssh/sshd_config 
sudo service sshd restart 
sudo groupadd sftp
sudo useradd -c "account for sftp user" -m sftpuser -g sftp 
sudo passwd sftpuser
bash --login
sudo chmod 700 /home/sftpuser/ 
sudo yum install -y ufw  
bash --login 
sudo echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules

