#!/bin/bash
#                    _           _        _ _ 
#  ___  _____  __   (_)_ __  ___| |_ __ _| | |
# / _ \/ __\ \/ /   | | '_ \/ __| __/ _` | | |
#| (_) \__ \>  <    | | | | \__ \ || (_| | | |
# \___/|___/_/\_\   |_|_| |_|___/\__\__,_|_|_|
#
echo"#############################" 
echo"#✅ 👽 👨‍💻 😎 🌟 🎲 🎱🚀 ##" 
echo"#############################" 
echo ""
echo "" 
echo "#-------------------------#"
echo "#  Mac OS Install Script  #"
echo "#-------------------------#"
sleep 3 
echo ""
echo "" 
echo "By luke-h1" 
echo ""
echo ""
sleep 3
echo "follow me on github... https://github.com/luke-h1" 
sleep 3
echo "" 
echo ""
echo ""
echo "###############################################" 
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #" 
echo "#         YOU'LL PROBABLY REGRET IT...        #" 
echo "#        ❌❌❌❌❌❌❌❌❌❌❌❌❌❌       #" 
echo "#                                             #" 
echo "#              READ IT THOROUGHLY             #" 
echo "#         AND EDIT TO SUIT YOUR NEEDS         #" 
echo "###############################################" 
echo "###############################################" 
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #" 
echo "#         YOU'LL PROBABLY REGRET IT...        #" 
echo "#        ❌❌❌❌❌❌❌❌❌❌❌❌❌❌       #" 
echo "#                                             #" 
echo "#              READ IT THOROUGHLY             #" 
echo "#         AND EDIT TO SUIT YOUR NEEDS         #" 
echo "###############################################" 
echo "###############################################" 
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #" 
echo "#         YOU'LL PROBABLY REGRET IT...        #" 
echo "#        ❌❌❌❌❌❌❌❌❌❌❌❌❌❌       #" 
echo "#                                             #" 
echo "#              READ IT THOROUGHLY             #" 
echo "#         AND EDIT TO SUIT YOUR NEEDS         #" 
echo "###############################################" 
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
  echo "Please go read the script, it only takes a few minutes 💻" 
  exit
fi
echo "installing xcode tools" 
xcode-select --install 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew update 
echo ""
echo ""
echo "installing ansible"
brew install ansible 
echo ""
echo ""
echo "install nvm & node"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 
bash --login #new shell 
nvm install stable
brew update  
brew upgrade node 
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config
sudo log config --mode "private_data:on" # enable viewing of protected log messages 
cd /Users/lukehowsam/.nvm 
sudo git fetch
bash --login 
##########################
## GITHUB CONFIGURATION. ## 
##########################
echo "" 
echo "" 
echo "Enter your github username:"
read user 
git config --global --replace-all user.name "$user" 
echo "Enter your github email:"
read email 
git config --global --replace-all user.email "$email" 
echo "Your github information has now been configured globally.."

###############################################################################
# ICLOUD                                                                      #
###############################################################################
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
echo "Would you like to set your computer name (as done via System Preferences >> Sharing)?  (y/n)"
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

###############################################################################
# SAFARI CONFIG 
###############################################################################
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

###############################################################################
# UI CONFIG 
###############################################################################
echo ""
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

###############################################################################
# Kill affected applications
###############################################################################
echo ""
echo "Done!" $cyan
echo ""
echo ""
echo ""
echo ""
echo "Note that some of these changes require a logout/restart to take effect." 
echo "Killing some open applications in order to take effect." 
echo ""

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done


###############################################################################
# INSTALL LINTER TOOLS  
###############################################################################
npm install -g prettier eslint-config-airbnb eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks



###############################################################################
# INSTALL APPLICATIONS THAT CANNOT BE AUTOMATED W/ BASH & ANSIBLE 
###############################################################################
echo ""
echo ""
echo "Installing Macs-Fan-Control, ProtonVPN & OBS"
wget https://crystalidea.com/macs-fan-control/download
wget https://protonvpn.com/download/ProtonVPN.dmg
wget https://cdn-fastly.obsproject.com/downloads/obs-mac-25.0.8.dmg  

###############################################################################
# SET SHELL TO ZSH 
###############################################################################
echo ""
echo "setting ZSH as default shell 👨‍💻" 
echo ""
chsh -s /bin/zsh 
echo "all done :) ✅ 🍦 🚀" 

###############################################################################
# REBOOT 
###############################################################################
sleep 3
REBOOT=false 
echo ""
echo "" 
echo "would you like to reboot in order for changes to take effect (y/n) ? " 
read -r res 
if [[ $res =~ ^( [yY])$ ]]; then 
    REBOOT = true  
    echo "enter your password to reboot"
    sudo reboot -h now  
    fi 

if ! $res; then 
    echo "ok not rebooting... some changes will need a reboot to function 🍦" 
    exit 
  fi 
