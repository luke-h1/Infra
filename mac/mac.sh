#!/bin/bash
echo "starting the install script..." 
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
echo "now configuring your github username & email globally..."
echo "" 
vcecho ""
echo "enter your github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "" 
echo "" 
echo "added your username to git config global" 
echo "" 
echo "" 
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
brew install python 
brew install bash
echo "/usr/local/sbin" >> /etc/paths 
brew install python
brew cask install iterm2 
brew install vcprompt 
brew install bash
brew upgrade bash
brew cask install google-chrome 
brew cask install visual-studio-code 
brew cask install docker
brew install docker-compose
brew install docker-machine 
brew install wget
brew cask install gpg-suite 
brew install ssh-copy-id 
brew cask install bash-completion 
brew cask install spectacle 
brew cask install alfred 
brew cask install virtualbox 
brew cask install insomnia 
brew install htop 
brew install vim 
brew install openvpn 
brew install tmux 
brew install screen
brew install dialog 
brew install node  
sudo npm i react -g 
sudo npm i prop-types -g  
sudo npm i moment -g 
sudo npm i express -g 
sudo npm i request -g 
sudo npm i lodash -g 
sudo npm i next -g 
sudo npm i async -g 
sudo npm i chalk -g 
sudo npm i debug -g 
sudo npm i lite-server -g 
sudo npm update
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config
brew install nmap
brew install links
brew install iproute2mac 
brew install watch
brew install coreutils
brew install openssl
brew install pkg-config
brew install cmake 
brew install readline
brew install heroku
brew install tree
brew install gcc
brew install gnupg 
brew install mariadb
brew install p7zip
brew install ack 
brew install midnight-commander
brew install gnutls
brew install subversion
brew install certbot
brew install mtr 
brew install gnu-sed
brew install cowsay
brew install speedtest-cli
brew install findutils
brew install gnu-tar
brew install aircrack-ng
brew install mcrypt
brew install libusb
brew install fortune
brew install openssh 
brew install md5sha1sum 
brew install pstree 
brew install grep
brew install brew-cask-completion
brew install moreutils
brew install screenfetch
brew install docker-completion
brew install gpg-agent
brew install dockutil
brew install trash
brew install findutils
brew install lolcat
brew install e2fsprogs
brew install webpack
brew install gnu-which
brew install terminator
brew install vcprompt 
brew install yarn 
brew cask install responsively
sudo log config --mode "private_data:on"
cd /Users/lukehowsam/.nvm 
sudo git fetch
echo "script finished" 
echo "rebooting in 5 seconds"  
sleep 5
sudo reboot   
 
  
