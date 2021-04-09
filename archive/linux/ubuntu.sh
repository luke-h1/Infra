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
echo ""
echo ""
echo "fetching fresh packages"
sudo apt-get update -y && sudo apt-get upgrade -y 

echo "installing curl"
echo ""
echo ""
sudo apt-get install -y curl 
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
echo "installing various pkgs"
echo ""
echo ""
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
sudo apt-get install -y snap
sudo snap install --classic heroku
sudo ufw enable
# drop IP pings 
# echo "-A ufw-before-input -p icmp --icmp-type echo-request -j DROP" >> /etc/ufw/before.rules
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
nodejs -v >> /users/lhowsam/node-log.txt
sudo apt-get install npm -y 
# install nvm 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source /users/lhowsam/.profile   
sudo apt-get install ansible -y 
sudo apt-get install -y zsh 
echo $SHELL 
chsh -s ${which zsh}
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# DBs 
sudo apt install postgresql postgresql-contrib
sudo apt install mysql-server
sudo mysql_secure_installation
systemctl status mysql.service
#--------------------
# Install manually: 
# Figma 
# intel power gadget 
# set ip tables stealth setting
# MongoDB Compass 
# Insomnia 
# Visual studio 
# malwarebytes
# beekeeper (DB GUI)
# aws cli (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
#--------------------
echo ""
echo ""
echo "asking for sudo permission to reboot:"
sudo reboot now 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install robotframework
pip install --upgrade robotframework-selenium2library
pip3 install docutils
pip3 installl pipenv
pip install --upgrade pip
curl https://dl.pstmn.io/download/latest/linux 
ar -xzf Postman-linux-x64-*.tar.gz
sudo rm -rf /opt/Postman 
sudo mv Postman /opt 
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
echo "
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Exec="/opt/Postman/Postman"
Comment=Postman GUI
Categories=Development;Code;
" >> /usr/share/applications/postman.desktop
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo snap install pycharm-community --classic
sudo apt install redis-server
sudo su - 
sudo passwd root 
echo "
. . .
# If you run Redis from upstart or systemd, Redis can interact with your
# supervision tree. Options:
#   supervised no      - no supervision interaction
#   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
#   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
#   supervised auto    - detect upstart or systemd method based on
#                        UPSTART_JOB or NOTIFY_SOCKET environment variables
# Note: these supervision methods only signal "process is ready."
#       They do not enable continuous liveness pings back to your supervisor.
supervised systemd

. . .
" >> /etc/redis/redis.conf
sudo systemctl restart redis.service
sudo systemctl status redis
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8
sudo apt-get update -y 
sudo apt install software-properties-common -y 
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8
python3.8 --version
sudo apt-get update -y 
sudo apt-get install -y python3-pip 
pip3 --version 
sudo -H pip3 install pipenv
#https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-completions&package=zsh-completions
sudo su - lhowsam
sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/1.28.6/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     . $(brew --prefix)/etc/bash_completion
# fi
sudo apt-get install -y stress youtube-dl htop vim tmux  nmap  httpie watch coreutils cmake ack certbot  grep lm-sensors dialog pulseaudio pavucontrol at bluez blueman pulseaudio-module-bluetooth unity-control-center

