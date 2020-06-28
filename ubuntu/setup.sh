#!/bin/bash 
sudo mkdir /srv/dev 
cd /srv/dev 
sudo mkdir /srv/isos 
sudo mkdir /srv/courses 
git clone https://github.com/luke-h1/dotfiles 
git clone https://github.com/luke-h1/xfce
sudo apt-get install -y curl 
sudo apt-get install -y ansible 
sudo apt-get update -y  
sudo apt-get install -y xfce4* 
sudo apt install software-properties-common apt-transport-https wget -y 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
echo "configured git" 
sudo rm -rf /home/lukehowsam/Pictures  
sudo rm -rf /home/lukehowsam/Documents  
sudo rm -rf /home/lukehowsam/Public 
sudo rm -rf /home/lukehowsam/Templates 
sudo rm -rf /home/lukehowsam/Music
sudo rm -rf /home/lukehowsam/Videos 
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update -y 
sudo apt install yarn

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc  | sudo apt-key add - 
sudo apt-get update -y 
sudo apt-get install insomnia 
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
sudo ufw enable 
sudo ufw allow 22/tcp  
sudo systemctl enable ufw 
sudo systemctl start ufw 
echo "script finished"=
telinit 6 
