#!/bin/bash

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash #install nvm 
nvm install stable
npm install -g lite-server eslint #install lite-server & eslint 

echo "enter your github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "added your username to git config global" 
echo "enter your github email" 
read email 
git config --global --replace-all user.email "$email" 
echo "added your email to git config global" 

echo "done. Exiting now...." 
sleep 2 


echo "configuring vs code extensions....." 


sleep 5 



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

     
