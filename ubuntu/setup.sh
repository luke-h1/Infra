#!/bin/bash 
git clone https://github.com/luke-h1/dotfiles 
git clone https://github.com/luke-h1/responsive-webdesign
git clone https://github.com/luke-h1/navbar-animation-css 
git clone https://github.com/luke-h1/div-span-button-box-css
git clone https://github.com/luke-h1/xfce
sudo apt-get install -y curl 
sudo apt-get update -y  
sudo apt-get install -y nodejs npm nvm 
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node
nvm install 8.10.0
nvm use 10.16.3
nvm alias default 10.16.3
sudo apt-get install -y xfce4* 
sudo apt install software-properties-common apt-transport-https wget -y 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code 
sudo apt-get install -y npm* --skip-broken

echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
sudo mkdir /srv/git 
sudo mkdir /srv/git/dev 
sudo mkdir /srv/isos 
sudo mkdir /srv/courses 
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

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
sudo ufw start 
sudo systemctl enable ufw 
sudo systemctl start ufw 

echo "script finished"
echo "rebooting in 5 seconds" 
sleep 5 
telinit 6 
