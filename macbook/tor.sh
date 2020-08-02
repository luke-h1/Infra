#!/bin/bash 

INTERFACE=Ethernet #config whether use wifi or ethernet 
sudo -v # ask for sudo password upfront 

# keep alive 
while true; do sudo -n true ; sleep 60 ; kill -0 "$$" || exit; done 2> /dev/null & 

# trap ctrl + c & then call disable_proxy() function 
function disable_proxy() { 
  sudo networksetup -setsocksfirewallproxystate $INTERFACE off 
  echo "$(tput setaf 64)" 
  echo "SOCKS PROXY DISABLED" 
  echo "$(tput sgr0)"
}
trap disable_proxy INT 


# let's connect ! 
sudo networksetup -setsocksfirewallproxy $INTERFACE 127.0.0.1 9050 off 
sudo networksetup -setsocksfirewallproxystate $INTERFACE on 

tor 
