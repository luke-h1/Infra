#!/bin/bash
echo "##########################"
echo "✨ Mac Install Script ✨ "
echo "##########################"
echo ""
echo "" 
echo "By luke-h1" 
echo ""
echo ""
sleep 1
echo "follow me on github: https://github.com/luke-h1" 
sleep 2
echo "" 
echo ""
echo ""
echo "###############################################" 
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #" 
echo "#         YOU'LL PROBABLY REGRET IT...        #" 
echo "#              READ IT THOROUGHLY             #" 
echo "#         AND EDIT TO SUIT YOUR NEEDS         #" 
echo "###############################################" 
echo ""
echo ""
echo "" 
sleep 3
CONTINUE=false
echo ""
echo "Have you read through the script you're about to run and "
echo "understood that it will make changes to your computer? (y/n) ? "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    CONTINUE=true
fi

if ! $CONTINUE; then
    echo "Please go read the script, it only takes a few minutes"
    exit 5
fi
echo ""
echo ""
echo ""
echo "Would you like to generate a new ssh key ?"
read -r ssh_res
if [[ $ssh_res =~ ^([yY][eE][sS]|[yY])$ ]]; then
    GEN_KEY=true
fi
ssh-keygen

if ! $GEN_KEY; then
    echo "Not generating new ssh key & continuing with script"
    exit 5
fi
 
sleep 2
osascript -e 'tell application "System Preferences" to quit'
echo "installing xcode tools" 
xcode-select --install 
echo "Installing Homebrew..."
if ! command -v COMMAND &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed. Skipping."
fi
brew update 
brew upgrade 
brew tap homebrew/services \ 
  mongodb/brew

brew install ansible \ 
  python3 \ 
  curl \ 
  wget \ 
  mysql \ 
  mongodb-community 

sudo easy_install pip 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 
nvm install stable
brew update  
brew upgrade node 
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config # put your username here 
cd /Users/lukehowsam/.nvm # put your username here 
sudo git fetch
echo ""
echo ""
echo "installing Azure data studio"
wget https://go.microsoft.com/fwlink/?linkid=2151311

# GITHUB CONFIGURATION
echo "" 
echo "" 
echo "Configuring github information globally"
echo ""
echo ""
echo "Enter your github username:"
read user 
git config --global --replace-all user.name "$user" 
echo "Enter your github email:"
read email 
git config --global --replace-all user.email "$email" 
echo "Your github information has now been configured globally.."

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
echo "" 
echo "" 
echo "Mac App store section" 

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
echo ""
echo "Would you like to set your hostname / computer (as done via System Preferences >> Sharing)?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "What would you like it to be?"
  read HOSTNAME 
  sudo scutil --set ComputerName $HOSTNAME
  sudo scutil --set HostName $HOSTNAME
  sudo scutil --set LocalHostName $HOSTNAME
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME
fi
echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300
echo ""
echo "Disable display from automatically adjusting brightness? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
fi
echo ""
echo "Where do you want screenshots to be stored? (hit ENTER if you want ~/Desktop as default)"
# Thanks https://github.com/omgmog
read screenshot_location
echo ""
if [ -z "${screenshot_location}" ]
then
  # If nothing specified, we default to ~/Desktop
  screenshot_location="${HOME}/Desktop"
else
  # Otherwise we use input
  if [[ "${screenshot_location:0:1}" != "/" ]]
  then
    # If input doesn't start with /, assume it's relative to home
    screenshot_location="${HOME}/${screenshot_location}"
  fi
fi
echo "Setting location to ${screenshot_location}"
defaults write com.apple.screencapture location -string "${screenshot_location}"

echo ""
echo ""
echo "Show hidden files in Finder by default? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.Finder AppleShowAllFiles -bool true
fi

# SHOW MOUNTED VOLUMES ON DESKTOP 
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo ""
echo "Safari section" 
# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
echo ""
echo "Privacy: Don't send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
echo ""
echo "Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false
echo ""
echo "Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
echo ""
echo "Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
echo ""
echo "Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
echo ""
echo "Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
echo ""
echo "Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"
echo "" 

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
echo "" 
echo "" 

# UI CONFIG
echo ""
echo ""
echo "Speed up various animations"
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSWindowResizeTime -float 0.001
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0.001
echo ""
echo ""
echo "disable bouncing icons in dock"
defaults write com.apple.dock no-bouncing -bool false
echo ""
echo ""
echo "speed up launchpad animations"
defaults write com.apple.dock springboard-show-duration -float 0.1
defaults write com.apple.dock springboard-hide-duration -float 0.11
defaults write com.apple.dock springboard-page-duration -float 0.1
echo ""
echo "Always show scrollbars"  
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
echo ""
echo ""
echo "Quit printer app once print jobs have finished" 
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
echo ""
echo ""
echo "require password immediately after sleep or screen saver"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
echo ""
echo ""
echo "disable window animations"
defaults write com.apple.finder DisableAllAnimations -bool true
echo ""
echo ""
echo "Use list view in finder windows"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo ""
echo ""
echo "Speed up Mission control animation"
defaults write com.apple.dock expose-animation-duration -float 0.1
echo ""
echo ""
echo "Auto hide dock"
defaults write com.apple.dock autohide -bool true
echo ""
echo ""
echo "Change Menu bar clock format"
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm"
echo ""
echo ""
echo "Wipe all default icons from Dock"
defaults write com.apple.dock persistent-apps -array
echo ""
echo ""
echo "Move Dock to right"
defaults write com.apple.dock orientation right

echo "Do you use Transmission for torrenting? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  mkdir -p ~/Downloads/Incomplete
  echo ""
  echo "Setting up an incomplete downloads folder in Downloads"
  defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
  defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"
  echo ""
  echo "Setting auto-add folder to be Downloads"
  defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"
  echo ""
  echo "Don't prompt for confirmation before downloading"
  defaults write org.m0k.transmission DownloadAsk -bool false
  echo ""
  echo "Trash original torrent files after adding them"
  defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
  echo ""
  echo "Hiding the donate message"
  defaults write org.m0k.transmission WarningDonate -bool false
  echo ""
  echo "Hiding the legal disclaimer"
  defaults write org.m0k.transmission WarningLegal -bool false
  echo ""
  echo "Auto-resizing the window to fit transfers"
  defaults write org.m0k.transmission AutoSize -bool true
  echo ""
  echo "Auto updating to betas"
  defaults write org.m0k.transmission AutoUpdateBeta -bool true
  echo ""
  echo "Setting up the best block list"
  defaults write org.m0k.transmission EncryptionRequire -bool true
  defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
  defaults write org.m0k.transmission BlocklistNew -bool true
  defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
fi

brew install --cask pycharm \ 
  docker-toolbox \ 
  postman \  
  docker \ 
  iterm2 \ 
  vlc \ 
  spectacle \ 
  redis
  
brew services start redis
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install robotframework
pip install --upgrade robotframework-selenium2library
pip3 install docutils
pip3 installl pipenv
pip install --upgrade pip
brew services start mongodb-community 
mongo --version 
echo "running wget.sh"
./wget.sh
echo "running composer.sh"
./composer.sh
echo "running ansible playbook"
ansible-playbook -u lukehowsam -K -K --ask-pass -vvv mac.yml

cp -r dotfiles/.ssh /Users/lukehowsam/.ssh 
cp -r dotfiles/.zshrc /Users/lukehowsam/.zshrc
cp -r dotfiles/.gitignore_global /Users/lukehowsam/.gitignore_global

echo "Do you have VS code installed ? (y/n)"
read -r IS_INSTALLED
if [[ $IS_INSTALLED =~ ^([yY][eE][sS]|[yY])$ ]]; then
    INSTALL=true
fi

if ! $IS_INSTALLED; then
    echo "Ok not installing VS code extensions"
    exit
fi
source ~/.zshrc
cd ..
./vscode.sh
./nvm.sh

cd mac
echo "Checking for OSX related updates" 
softwareupdate --all --install --force

echo "the following command will kill all applications & reboot in order for changes to take effect"
REBOOT=false

echo "Do you want to kill all applications & reboot in order for changes to take effect ? (y/n)"
read -r USER_INPUT
if [[ $USER_INPUT =~ ^([yY][eE][sS]|[yY])$ ]]; then
    REBOOT=true
fi

if ! $USER_INPUT; then
    echo "Ok not rebooting 💻"
    exit
fi
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done 
#--------------------
# Install manually: 
# macs fan control
# Adobe XD 
# intel power gadget 
# stealth-mode mac setting   
# MongoDB Compass 
# Postman 
# Insomnia 
# Google Chrome Dev
# PIA client 
# Visual studio 
# Xcode 
# malwarebytes
# beekeeper (DB GUI)
# aws cli (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
# go https://golang.org/dl/
# dotnet sdk (https://docs.microsoft.com/en-us/dotnet/core/install/macos)
# dotnet ef (dotnet tool install -g dotnet-ef)
#--------------------
echo "asking for sudo permission to reboot"
sudo reboot now 
