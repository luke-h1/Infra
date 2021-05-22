#!/bin/bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y 
sudo apt-get upgrade -y
sudo apt install -y php7.4
php -v 
sudo apt-get install -y php-cli unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo "alias composer='/usr/local/bin/composer.phar'" >> .zshrc
