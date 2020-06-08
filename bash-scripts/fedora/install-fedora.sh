#!/bin/bash


function media_fedora() { 
	dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg


sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm   && dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg

su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'


sudo dnf install lame\* --exclude=lame-devel

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf update -y

  sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-multimedia.repo


dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm
dnf install ffmpeg-libs compat-ffmpeg28

dnf install gstreamer1-libav gstreamer1-plugins-ugly
dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm
dnf install gstreamer1-libav gstreamer1-plugins-ugly unrar compat-ffmpeg28 ffmpeg-libs



sudo dnf groupupdate multimedia
sudo dnf install compat-ffmpeg28
sudo systemctl restart snapd 
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install chromium-ffmpeg


sudo dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install chromium-libs-media-freeworld


sudo dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm


sudo dnf install compat-ffmpeg28 ffmpeg-libs

sudo yum update -y && sudo dnf update -y && systemctl daemon-reload 


} 


media_fedora
