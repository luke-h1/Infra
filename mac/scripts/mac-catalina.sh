#!/bin/zsh
#                    _           _        _ _ 
#  ___  _____  __   (_)_ __  ___| |_ __ _| | |
# / _ \/ __\ \/ /   | | '_ \/ __| __/ _` | | |
#| (_) \__ \>  <    | | | | \__ \ || (_| | | |
# \___/|___/_/\_\   |_|_| |_|___/\__\__,_|_|_|


# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
echo "Mac OS X install script" 
sleep 3 
echo "By luke-h1" 
sleep 3 
echo "follow me on github... https://github.com/luke-h1" 
sleep 3 
echo ""
echo "###############################################" $red
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
echo "#         YOU'LL PROBABLY REGRET IT...        #" $red
echo "#                                             #" $red
echo "#              READ IT THOROUGHLY             #" $red
echo "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
echo "###############################################" $red
echo ""
sleep 3 
CONTINUE=false
echo ""
echo "Have you read through the script you're about to run and " $red
echo "understood that it will make changes to your computer? (y/n) ? " $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

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
brew services start mongodb-community@4.2  
bash --login 
echo "Enter your github username:"
read user 
git config --global --replace-all user.name "$user" 
echo "Enter your github email:"
read email 
git config --global --replace-all user.email "$email" 
echo "Your github information has now been configured globally.."



# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1


echo ""
cecho "Done!" $cyan
echo ""
echo ""
echo "################################################################################" $white
echo ""
echo ""
echo "Note that some of these changes require a logout/restart to take effect." $red
echo ""
echo ""
echo -n "Check for and install available OSX updates, install, and automatically restart? (y/n)? "
read response
if [ "$response" != "${response#[Yy]}" ] ;then
    softwareupdate -i -a --restart
fi