#!/bin/bash 
#   __  ______  __  ___   __________  __        
#  / / / / __ )/ / / / | / /_  __/ / / /        
# / / / / __  / / / /  |/ / / / / / / /         
#/ /_/ / /_/ / /_/ / /|  / / / / /_/ /          
#\____/_____/\____/_/_|_/_/_/  \____/  __       
#   /  _/ | / / ___/_  __/   |  / /   / /       
#   / //  |/ /\__ \ / / / /| | / /   / /        
# _/ // /|  /___/ // / / ___ |/ /___/ /___      
#/___/_/ |_//____//_/ /_/  |_/_____/_____/      
                                              
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

sudo apt-get install -y curl 
sudo apt install software-properties-common apt-transport-https wget -y 
echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
sudo apt install -y openvpn dialog python3-pip python3-setuptools 
sudo pip3 install protonvpn-cli
sudo apt-get install -y snap 
sudo snap install --classic heroku
sudo ufw enable 
sudo ufw allow 22/tcp  
sudo systemctl enable ufw 
sudo systemctl start ufw 
sudo apt-get install -y openssh* 
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb 
sudo apt install ./teamviewer_amd64.deb 
sudo apt-get install -y ssh*  
sudo apt-get install -y xfce* 
echo
"Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
" >> /etc/ssh/sshd_config 
sudo service ssh restart 
sudo addgroup sftp
sudo useradd -m sftpuser -g sftp 
sudo passwd sftpuser
sudo chmod 700 /home/sftpuser/ 
echo "elevating to root to change ufw settings..."
sudo su - 
sudo chmod 700 /home/sftpuser/  
echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules
sudo yum groupinstall "Server with GUI" -y
sudo yum groupinstall "Xfce" -y
sudo systemctl set-default graphical.target
sudo ufw disable
sudo ufw enable
echo "rebooting now..."
sleep 3 
sudo reboot -h 3