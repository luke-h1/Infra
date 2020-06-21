#!/bin/bash
echo "starting the install script..." 
sleep 2 
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew update -y 
brew install ansible
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash #install nvm 
bash --login 
nvm install stable
bash --login 
sudo brew update -y 
sudo brew upgrade node 
bash --login 
npm install -g lite-server eslint #install lite-server & eslint 
echo "enter your github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "added your username to git config global" 
echo "enter your github email" 
read email 
git config --global --replace-all user.email "$email" 
echo "configured your github name & email globally"
sleep 3 
brew cask install postman -y 
cd /srv 
sleep 3  
git clone https://github.com/luke-h1/scrimba-html-css 
git clone https://github.com/luke-h1/dotfiles 
git clone https://github.com/luke-h1/responsive-webdesign
git clone https://github.com/luke-h1/navbar-animation-css 
git clone https://github.com/luke-h1/div-span-button-box-css
git clone https://github.com/luke-h1/Automation
git clone https://github.com/transmission/transmission-releases/raw/master/Transmission-3.00.dmg
mkdir /srv/dev  
mkdir /srv/isos 
mkdir /srv/courses
mkdir /home/lukehowsam/notes 
mkdir /home/lukehowsam/wallpapers  
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
cd /opt 
wget https://dl4.cdn.filezilla-project.org/client/FileZilla_3.48.1_macosx-x86.app.tar.bz2?h=wwgqOzBgcM_1qpU8jV-1gw&amp;x=1592412932
sleep 5 
wget https://videolan.mirror.liteserver.nl/vlc/3.0.11/macosx/vlc-3.0.11.dmg
wget https://download.virtualbox.org/virtualbox/6.1.10/VirtualBox-6.1.10-138449-OSX.dmg
wget //download.documentfoundation.org/libreoffice/stable/6.4.4/mac/x86_64/LibreOffice_6.4.4_MacOS_x86-64.dmg
echo "install Kali & ubuntu isos to /opt directory"  
wget https://cdimage.kali.org/kali-2020.2/kali-linux-2020.2-live-amd64.iso  
wget ubuntu-18.04.4-desktop-amd64.iso 
echo "script finished" 
echo "rebooting in 5 seconds"  
sleep 5  
telinit 6 
 
  