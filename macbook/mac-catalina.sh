#!/bin/bash
#                    _           _        _ _ 
#  ___  _____  __   (_)_ __  ___| |_ __ _| | |
# / _ \/ __\ \/ /   | | '_ \/ __| __/ _` | | |
#| (_) \__ \>  <    | | | | \__ \ || (_| | | |
# \___/|___/_/\_\   |_|_| |_|___/\__\__,_|_|_|
#
echo "##########################"
echo "✨ Mac OS Install Script ✨"
echo "##########################"
echo ""
echo "" 
echo "By luke-h1" 
echo ""
echo ""
sleep 1
echo "follow me on github... https://github.com/luke-h1" 
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
echo ""
echo "Installing Homebrew..."
if ! command -v COMMAND &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  log "Homebrew already installed. Skipping."
fi
echo "updating homebrew"
brew update 
echo "upgrading homebrew"
brew upgrade 
echo ""
echo ""
echo "installing ansible"
brew install ansible 
echo "install pip"
sudo easy_install pip 
echo ""
echo ""
echo "installing wget"
brew install wget
echo "install nvm & node"
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
echo ""
echo ""
echo ""
echo ""
echo "installing mysql"
brew install mysql
brew tap homebrew/services 
###########################
## GITHUB CONFIGURATION. ## 
###########################
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
echo "" 
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
###############################################################################
# ICLOUD                                                                      #
###############################################################################
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
echo "" 
echo "" 
echo "Mac App store section" 
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
###############################################################################
# SAFARI CONFIG 
###############################################################################
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
echo "" 
echo "photo sections" 
###############################################################################
# Photos                                                                      #
###############################################################################
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
echo "" 
echo "" 
echo "UI Section" 
###############################################################################
# UI CONFIG 
###############################################################################
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
echo "" 
echo "" 
echo "Transmission section" 
################################################################################
# TRANSMISSION                                                                 #
################################################################################
echo ""
echo ""
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
echo "" 
echo "" 
echo "" 
echo "" 
echo "Install chrome & firefox webdrivers" 
###############################################################################
# INSTALL & CONFIGURE CHROME + FIREFOX WEB DRIVERS 
###############################################################################
echo "enter your username here"
echo ""
echo ""
read uname 
cd /Users/${uname}/Downloads/
echo "installing geckodriver"
echo ""
echo ""
curl https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-macos.tar.gz 
echo "installing chromedriver" 
echo ""
echo ""
curl https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_mac64.zip 
echo "unzipped .zip files & moving to /usr/local/bin"
unzip *.zip 
sudo mv chromedriver /usr/local/bin 
sudo mv geckodriver /usr/local/bin 
sudo chown -R ${uname}:staff /usr/local/bin/geckodriver 
sudo chown -R ${uname}:staff /usr/local/bin/chromedriver
sudo chmod 770 /usr/local/bin/chromedriver
sudo chmod 770 /usr/local/bin/geckodriver
echo "" 
echo "" 
echo "installing brew casks: pycharm, docker-toolbox, postman, iterm2, vlc & spectacle"
brew install --cask pycharm
brew install --cask docker-toolbox
brew install --cask postman
brew install --cask docker
brew install --cask iterm2
brew install --cask vlc
brew install --cask spectacle
echo ""
echo ""
echo "installing volta (https://volta.sh/)"
curl https://get.volta.sh | bash
volta install node
volta install yarn
sleep 5
##########################
# SETUP PYTHON ENVIRONMENT 
##########################
brew install python3
brew install curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install -U https://github.com/robotframework/RIDE/archive/master.zip
pip3 install robotframework
pip3 install robotframework-requests
pip3 install robotframework-react
pip3 install --upgrade robotframework-stublibrary
pip install --upgrade robotframework-selenium2library
pip3 install docutils
pip3 installl pipenv
pip install --upgrade pip
##########################
# INSTALL & SETUP MONGODB
##########################
brew tap mongodb/brew && brew install mongodb-community 
brew services start mongodb-community 
mongo --version 
sleep  3 # sleep to check mongo is on the right version & has installed succesfully 
###############################################################################
# CHECK FOR ANY MACOS RELATED UPGRADES
###############################################################################
echo "Checking for OSX related updates" 
softwareupdate --all --install --force
###############################################################################
# Kill affected applications
###############################################################################
echo ""
echo ""
echo "the following command will kill all applications & reboot in order for changes to take effect"
REBOOT=false
echo ""
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
# ADS 
# Figma 
# intel power gadget 
# stealth-mode mac setting   
# MongoDB Compass 
# Postman 
# Insomnia 
# Google Chrome Dev (for work account)
# PIA client 
# Pycharm 
# Visual studio 
# Xcode 
# aws cli (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
#--------------------
echo ""
echo ""
echo "asking for sudo permission to reboot:"
sudo reboot now 
