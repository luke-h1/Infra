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
sudo apt install software-properties-common apt-transport-https wget -y 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
echo "configuring vs code extensions....." 
sleep 1  
code --install-extension PeterJausovec.vscode-docker \
     --install-extension christian-kohler.npm-intellisense \
     --install-extension nur.just-black \ 
     --install-extension esbenp.prettier-vscode-4.7.0 \ 
     --install-extension hookyqr.beautify-1.5.0 \ 
     --install-extension dbaeumer.vscode-eslint-2.1.5 \ 
     --install-extension christian-kohler.path-intellisense-1.4.2 \ 
     --install-extension coenraads.bracket-pair-colorizer-1.0.61  \ 
     --install-extension pkief.material-icon-theme-4.1.0 \ 
     --install-extension ritwickdey.liveserver-5.6.1 \ 
     --install-extension zignd.html-css-class-completion-1.19.0 \ 

echo "VS code extensions now configured..."     

echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email"
read email
git config --global --replace-all user.email "$email"

