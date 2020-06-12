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
 
