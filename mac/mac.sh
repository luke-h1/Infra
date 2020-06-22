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
rm -rf /Users/lukehowsam/Pictures  
rm -rf /Users/lukehowsam/Documents  
rm -rf /Users/lukehowsam/Public 
rm -rf /Users/lukehowsam/Templates 
rm -rf /Users/lukehowsam/Music
rm -rf /Users/lukehowsam/Videos 
mkdir /opt
cd /opt 
wget https://dl4.cdn.filezilla-project.org/client/FileZilla_3.48.1_macosx-x86.app.tar.bz2?h=wwgqOzBgcM_1qpU8jV-1gw&amp;x=1592412932
wget https://videolan.mirror.liteserver.nl/vlc/3.0.11/macosx/vlc-3.0.11.dmg
wget https://download.virtualbox.org/virtualbox/6.1.10/VirtualBox-6.1.10-138449-OSX.dmg
wget //download.documentfoundation.org/libreoffice/stable/6.4.4/mac/x86_64/LibreOffice_6.4.4_MacOS_x86-64.dmg
echo "script finished" 
echo "rebooting in 5 seconds"  
echo "VPN TO-DO: https://hide.me/en/?friend=54b08be283830&chan=ba_e"  
sleep 5  
telinit 6 
 
  
