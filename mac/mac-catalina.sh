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
DIRECTORY1="/Users/$USER/srv"
DIRECTORY2="/Users/$USER/srv/isos"
DIRECTORY3="/Users/$USER/srv/dev"
DIRECTORY4="/Users/$USER/srv/courses"
DIRECTORY5="/Users/$USER/notes"
#simple for loop that will loop over the above directories. 
#Add your own custom directories as needed & adjust regex below as needed
for i in $DIRECTORY[0-5] ;
        do
                 mkdir -p $DIRECTORY1
                 mkdir -p $DIRECTORY2
                 mkdir -p $DIRECTORY3
                 mkdir -p $DIRECTORY4
                 mkdir -p $DIRECTORY5
                done
echo "$(tput setaf 4)Enter your github username:$(tput sgr0)"
read user 
git config --global --replace-all user.name "$user" 
echo "$(tput setaf 4)Enter your github email:$(tput sgr0)"
read email 
git config --global --replace-all user.email "$email" 
echo "$(tput setaf 1)Your github information has now been configured globally...$(tput sgr0)"
brew cask install postman  
brew install wget  
brew install python 
brew install bash
sudo echo "/usr/local/sbin" >> /etc/paths # /usr/local/sbin already in /etc/paths as of Catalina 10.15 
brew install python
brew cask install iterm2 
brew install vcprompt 
brew install bash
brew upgrade bash
brew cask install caffeine 
brew cask install visual-studio-code 
brew cask install docker
brew install docker-compose
brew install docker-machine 
brew install wget
brew cask install gpg-suite 
brew install ssh-copy-id 
brew cask install spectacle 
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
if [ $choice == "y" ] ;
then
        sudo reboot -h now
elif [ $choice == "n" ] ;
then
        echo "not rebooting"
fi
        exit 55
