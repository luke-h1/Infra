#!/bin/bash
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew update
brew install ansible
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 
bash --login #new shell 
nvm install stable
brew update 
brew upgrade node 
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config
sudo log config --mode "private_data:on" 
cd /Users/lukehowsam/.nvm 
sudo git fetch
brew services start openvpn
