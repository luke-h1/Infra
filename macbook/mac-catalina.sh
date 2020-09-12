#####################################################################
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
# SETUP PYTHON ENV
###############################################################################
echo ""
sudo rm -rf /Library/Frameworks/Python.framework/Versions/2.7
sudo rm -rf "/Applications/Python 2.7"
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7'
cd /usr/local/bin/
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7' | awk '{print $9}' | tr -d @ | xargs rm
brew install python
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install -U https://github.com/robotframework/RIDE/archive/master.zip
pip3 install robotframework
pip3 install robotframework-requests
python3.8 -m pip install --upgrade pip
echo "checking python 3.8 is the only python present (instead of python2)"
pkgutil --pkgs | grep org.python.Python
pkgutil --pkgs | grep org.python.Python >> /Users/lukehowsam/python-log.txt
pip3 install docutils
robot QuickStart.rst
robot --log report.html --name Custom_Name QuickStart.rst


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
