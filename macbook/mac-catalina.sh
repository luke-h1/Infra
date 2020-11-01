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
sleep 3
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
    # Check if we're continuing and output a message if not
    echo "Please go read the script, it only takes a few minutes"
    exit
fi
echo ""
echo ""
echo ""
echo ""
sleep 2
echo "installing xcode tools" 
xcode-select --install 
echo ""
echo ""
echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
echo "updating homebrew"
brew update 
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
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config
sudo log config --mode "private_data:on" # enable viewing of protected log messages 
cd /Users/lukehowsam/.nvm 
sudo git fetch
###########################
## GITHUB CONFIGURATION. ## 
###########################
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
echo "icloud section" 
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
# ALLOW APPLICATIONS TO BE INSTALLED FROM ANYWHERE (no annoying security prompt in settings)
sudo spctl --master-disable
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
echo "Ui Section" 
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
echo "Install DMG sections" 
####################
# Get various DMGs #
####################
echo ""
echo ""
echo "Installing Macs-Fan-Control, color picker,  ProtonVPN & OBS"
wget https://crystalidea.com/macs-fan-control/download # macs fan control 
wget https://protonvpn.com/download/ProtonVPN.dmg # protonvpn 
wget https://cdn-fastly.obsproject.com/downloads/obs-mac-25.0.8.dmg  # obs 
wget https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.1/CCA-3.1.1.dmg # color picker
wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.3.1/gatling-charts-highcharts-bundle-3.3.1-bundle.zip
wget https://download.visualstudio.microsoft.com/download/pr/5fd170f1-05d8-4126-ae8f-9ff9dc683466/997547015dac7edcb155e5ac917b0c72/aspnetcore-runtime-3.1.9-osx-x64.tar.gz
sleep  3 
echo "" 
echo "" 
echo "Setup python + robot env section" 
###############################################################################
# SETUP PYTHON & ROBOT ENV 
###############################################################################
sudo rm -rf /usr/local/bin/python*
sudo rm -rf /Library/Frameworks/Python.framework/Versions/*
brew install python3
brew link python@3.8 --overwrite
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install -U https://github.com/robotframework/RIDE/archive/master.zip
pip3 install robotframework
pip3 install robotframework-requests
pip3 install robotframework-react
pip3 install --upgrade robotframework-stublibrary
pip install --upgrade robotframework-selenium2library
python3.8 -m pip install --upgrade pip
echo "checking python 3.8 is the only python present (instead of python2)"
pkgutil --pkgs | grep org.python.Python 
pkgutil --pkgs | grep org.python.Python >> /Users/lukehowsam/python-log.txt 
pip3 install docutils
pip3 installl pipenv
echo "" 
echo "" 
echo "Install chrome & firefox webdrivers section" 
###############################################################################
# INSTALL & CONFIGURE CHROME + FIREFOX WEB DRIVERS 
###############################################################################
echo "installing geckodriver"
echo ""
echo ""
wget https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-macos.tar.gz 
echo "installing chromedriver" 
echo ""
echo ""
wget https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_mac64.zip 
echo "unzipped .zip files & moving to /usr/local/bin"
unzip *.zip 
sudo mv chromedriver /usr/local/bin 
sudo mv geckodriver /usr/local/bin 
sudo chown -R lukehowsam:staff /usr/local/bin/geckodriver 
sudo chown -R lukehowsam:staff /usr/local/bin/chromedriver
sudo chmod 770 /usr/local/bin/chromedriver
sudo chmod 770 /usr/local/bin/geckodriver
echo "" 
echo "" 

###############################################################################
# CHECK FOR ANY MACOS RELATED UPGRADES
###############################################################################
echo "" 
echo "" 
echo "Check for Macos related updates section" 
softwareupdate --all --install --force
###############################################################################
# Kill affected applications
###############################################################################
echo ""
echo ""
echo "the following command will kill all applications & reboot in order for changes to take effect"
sleep 3
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
