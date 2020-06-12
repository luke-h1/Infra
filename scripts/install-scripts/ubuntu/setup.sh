#!/bin/bash 
git clone https://github.com/luke-h1/scrimba-html-css 
git clone https://github.com/luke-h1/dotfiles 
git clone https://github.com/luke-h1/responsive-webdesign
git clone https://github.com/luke-h1/navbar-animation-css 
git clone https://github.com/luke-h1/div-span-button-box-css
git clone https://github.com/luke-h1/xfce
sudo apt-get update -y  
sudo apt-get install -y nodejs npm nvm 
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node
nvm install 8.10.0
nvm use 10.16.3
nvm alias default 10.16.3
sudo apt update -y 
sudo apt-get install -y xfce4* 
sudo apt install software-properties-common apt-transport-https wget -y 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
echo "VS code extensions now configured..."     
echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
mkdir /srv/git 
mkdir /srv/isos 
mkdir /srv/courses 
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
echo "script finished"
echo "rebooting in 5 seconds" 
telinit 6 

