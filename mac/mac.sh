#!/bin/bash
echo "starting the install script..." 
sleep 2 
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew update
brew install ansible
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash #install nvm 
nvm install stable
brew update 
brew upgrade node 
npm install -g lite-server eslint #install lite-server & eslint globally 
echo "enter your github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "added your username to git config global" 
echo "enter your github email" 
read email 
git config --global --replace-all user.email "$email" 
echo "configured your github name & email globally"
sleep 3 
brew cask install postman  
mkdir /srv/dev  
cd /srv/dev 
echo "putting github repos in /srv/dev directory..." 
sleep 3  
git clone https://github.com/luke-h1/scrimba-html-css 
git clone https://github.com/luke-h1/dotfiles 
git clone https://github.com/luke-h1/responsive-webdesign
git clone https://github.com/luke-h1/navbar-animation-css 
git clone https://github.com/luke-h1/div-span-button-box-css
git clone https://github.com/luke-h1/Automation
git clone https://github.com/transmission/transmission-releases/raw/master/Transmission-3.00.dmg
mkdir -p /srv/isos 
mkdir -p /srv/courses
mkdir -p /Users/lukehowsam/notes 
mkdir -p /Users/lukehowsam/wallpapers  
mkdir /opt
cd /opt
brew install wget  
wget https://videolan.mirror.liteserver.nl/vlc/3.0.11/macosx/vlc-3.0.11.dmg
brew install python 
brew install bash
echo "installing protonvpn" 
sudo bash -c "git clone https://github.com/ProtonVPN/protonvpn-cli.git && ./protonvpn-cli/protonvpn-cli.sh --install"
echo "script finished" 
echo "rebooting in 5 seconds"  

sleep 5
reboot   
 
  
