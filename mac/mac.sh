#!/bin/bash
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew update
brew install ansible
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash #install nvm 
bash --login 
nvm install stable
brew update 
brew upgrade node 
sudo mkdir /srv 
sudo mkdir -p /srv/isos 
sudo mkdir -p /srv/dev 
sudo mkdir -p /srv/courses
sudo mkdir -p /Users/lukehowsam/notes 
sudo mkdir -p /Users/lukehowsam/wallpapers 
echo "github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "enter github email address:" 
read email 
git config --global --replace-all user.email "$email" 
sleep 2 
echo "configured your github name & email globally"
npm install -g eslint 
brew cask install postman  
brew install wget  
brew install python 
brew install bash
sudo echo "/usr/local/sbin" >> /etc/paths 
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
brew cask install spectacle 
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
brew install bash-completion 
brew install bash-git-prompt
brew install yarn 
brew cask install responsively
sudo log config --mode "private_data:on" 
cd /Users/lukehowsam/.nvm 
sudo git fetch
echo "script finished" 
sudo reboot   
 
  
