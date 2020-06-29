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
DIRECTORY1="/Users/lukehowsam/srv" 
DIRECTORY2="/Users/lukehowsam/srv/isos" 
DIRECTORY3="/Users/lukehowsam/srv/dev"
DIRECTORY4="/Users/lukehowsam/srv/courses"
DIRECTORY5="/Users/lukehowsam/notes" 

# checks if directories exist and if not create them 
if [ -d $DIRECTORY ] 
then
	echo "directories all ready exist. refusing to make the same directory...." 
elif 
	echo "directories don't exist yet... creating custom directories now" 
then
	sudo mkdir -p /Users/lukehowsam/srv 
	sudo mkdir -p /Users/lukehowsam/srv/isos 
	sudo mkdir -p /Users/lukehowsam/srv/dev
	sudo mkdir -p /Users/lukehowsam/srv/courses
	sudo mkdir -p /Users/lukehowsam/notes

fi 	


# checks if the above if statement worked and if not let user know that it has failed	
if [ -d $DIRECTORY ] ; 
then
	echo "directories have been created successfully" 
else
	echo "something went wrong with this script..." 
fi 
echo "github username:" 
read user 
git config --global --replace-all user.name "$user" 
echo "enter github email address:" 
read email 
git config --global --replace-all user.email "$email" 
sleep 2 
echo "configured your github name & email globally"
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
sudo npi i eslint -g 
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
brew install p7zip
brew install ack 
brew install gnutls
brew install certbot
brew install mtr 
brew install gnu-sed
brew install cowsay
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
brew install vcprompt 
brew install bash-completion 
brew install bash-git-prompt
brew install yarn 
brew cask install responsively
sudo log config --mode "private_data:on" 
cd /Users/lukehowsam/.nvm 
sudo git fetch
brew services enable openvpn
echo "script finished"
echo "would you like to reboot ? (y/n) " 
read choice 
if [ $choice == "y"|"Y" ] ; 
then
	sudo reboot  
elif [ $choice == "n" ] ; 
then
	echo "not rebooting" 
	exit 55 
