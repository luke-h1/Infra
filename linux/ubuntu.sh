#!/bin/bash
echo "###############################################"
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #"
echo "#         YOU'LL PROBABLY REGRET IT...        #"
echo "#                                             #"
echo "#              READ IT THOROUGHLY             #"
echo "#         AND EDIT TO SUIT YOUR NEEDS         #"
echo "###############################################"
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
user_for_bash_script="lukehowsam" # put your username here 

echo "installing curl"
echo ""
echo ""
sudo apt-get install -y curl -y 
sudo apt-get install -y git 
sudo apt install software-properties-common apt-transport-https wget -y
echo "configuring github"
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
sudo rm -rf /home/${user_for_bash_script}/Pictures
sudo rm -rf /home/${user_for_bash_script}/Documents
sudo rm -rf /home/${user_for_bash_script}/Public
sudo rm -rf /home/${user_for_bash_script}/Templates
sudo rm -rf /home/${user_for_bash_script}/Music
sudo rm -rf /home/${user_for_bash_script}/Videos
echo "installing various pkgs"
echo ""
echo ""
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
sudo apt-get install -y snap
sudo snap install --classic heroku
sudo ufw enable
sudo apt-get install -y openssh*
sudo apt-get install -y ssh*
sudo apt-get install -y xfce*
sudo apt-get install -y curl
sudo -v
# drop IP pings 
echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules
# set default to the GUI 
sudo systemctl set-default graphical.target
# Restart UFW to take in changes
sudo ufw disable
sudo ufw enable
echo "Making 5GB swap file (requires sudo permission)"
echo ""
echo ""
sudo dd if=/dev/zero of=/dev/swapfile bs=5G count=1
sudo chmod 600 /dev/swapfile
sudo mkswap /dev/swapfile
sudo swapon /dev/swapfile
echo ""
echo ""
echo "Installing Ansible, Node & NVM"
sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo apt-get install nodejs -y 
nodejs -v >> /users/${user_for_bash_script}/node-log.txt
sudo apt-get install npm -y 
# install nvm 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source /users/${user_for_bash_script}/.profile   
sudo apt-get install ansible -y 
sudo apt-get install -y zsh 
echo $SHELL 
chsh -s ${which zsh}
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"