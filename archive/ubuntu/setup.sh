#!/bin/bash 
git clone https://github.com/luke-h1/dotfiles 
sudo apt-get install -y curl 
sudo apt-get install -y ansible 
sudo apt install software-properties-common apt-transport-https wget -y 
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
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
sudo ufw enable 
sudo ufw allow 22/tcp  
sudo systemctl enable ufw 
sudo systemctl start ufw 
echo "script finished"
echo "rebooting in 5 seconds" 
sleep 5 
telinit 6 
