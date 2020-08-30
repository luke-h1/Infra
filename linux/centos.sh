#!/bin/bash
#     ██████╗███████╗███╗   ██╗████████╗ ██████╗ ███████╗      
#    ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔════╝      
#    ██║     █████╗  ██╔██╗ ██║   ██║   ██║   ██║███████╗      
#    ██║     ██╔══╝  ██║╚██╗██║   ██║   ██║   ██║╚════██║      
#    ╚██████╗███████╗██║ ╚████║   ██║   ╚██████╔╝███████║      
#    ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚══════╝      
#                                                            
#    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         
#    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         
#    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         
#    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         
#    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    
#    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    
#                                                        
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

##########################   
# CONFIGURE GITHUB INFO #
########################
echo "now configuring your github" 
echo "enter your github username:"
read user
git config --global --replace-all user.name "$user"
echo "added your username to git config global"
echo "enter your github email:"
read email
git config --global --replace-all user.email "$email"
sudo yum install -y ansible 
##############################    
# REMOVE DEFAULT DIRECTORIES #
##############################
rm -rf /home/lukehowsam/Pictures  
rm -rf /home/lukehowsam/Documents  
rm -rf /home/lukehowsam/Public 
rm -rf /home/lukehowsam/Templates 
rm -rf /home/lukehowsam/Music
rm -rf /home/lukehowsam/Videos 
sudo yum install software-properties-common apt-transport-https wget -y 
sudo yum install epel-release
sudo rpm --import  https://dl.tvcdn.de/download/linux/signature/TeamViewer2017.asc 
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo yum localinstall -y ./teamviewer.x86_64.rpm
yum --enablerepo epel-testing list transmission\*
###################   
# CONFIGURE SFTP ##
###################
echo "Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
" >> /etc/ssh/sshd_config 
sudo service sshd restart 
sudo groupadd sftp
sudo useradd -m sftpuser -g sftp 
sudo passwd sftpuser
bash --login
sudo chmod 700 /home/sftpuser/ 
bash --login 
###########################   
# DON"T RESPOND TO PINGS ##
###########################
sudo echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules