#!/bin/bash


function install_ansible() { 
yum update -y 
yum install -y epel-release 
yum install -y ansible 
} 


install_ansible

sudo rpm –-import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org


sudo rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

yum list available --disablerepo='*' --enablerepo=elrepo-kernel

sudo yum --enablerepo=elrepo-kernel install kernel-lt

reboot 

function media() { 
yum install -y blue* 
yum install -y bluez 
yum -y install pygobject2 bluez
systemctl start bluetooth.service 
systemctl daemon-reload 
systemctl restart bluetooth.service

yum -y install gstreamer-plugin-crystalhd.x86_64
yum -y install gstreamer1-plugins-bad-freeworld.x86_64
yum -y install gstreamer1-libav.x86_64
yum -y install gstreamer1-vaapi.x86_64


yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum install flash-plugin
yum install icedtea-web
yum install vlc smplayer ffmpeg HandBrake-{gui,cli}
yum install libdvdcss gstreamer{,1}-plugins-ugly gstreamer-plugins-bad-nonfree gstreamer1-plugins-bad-freeworld

sudo yum install -y vlc 



} 

media 


sudo dnf module reset php -y 
sudo dnf module install php:remi-7.4 -y
sudo yum install -y php-* --skip-broken  
sudo yum install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json
install_php 
