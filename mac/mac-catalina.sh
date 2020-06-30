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
echo "$(tput setaf 4)Enter your github username:$(tput sgr0)"
read user 
git config --global --replace-all user.name "$user" 
echo "$(tput setaf 4)Enter your github email:$(tput sgr0)"
read email 
git config --global --replace-all user.email "$email" 
echo "$(tput setaf 1)Your github information has now been configured globally...$(tput sgr0)"
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config
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
