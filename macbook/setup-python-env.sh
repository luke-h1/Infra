#!/bin/bash
sudo rm -rf /usr/local/bin/python*
sudo rm -rf /Library/Frameworks/Python.framework/Versions/*
brew install python3
brew install curl
brew link python@3.8 --overwrite
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo easy_install pip
pip3 install -U https://github.com/robotframework/RIDE/archive/master.zip
pip3 install robotframework
pip3 install robotframework-requests
pip3 install robotframework-react
pip3 install --upgrade robotframework-stublibrary
pip install --upgrade robotframework-selenium2library
python3.8 -m pip install --upgrade pip
echo "checking python 3.8 is the only python present (instead of python2)"
pkgutil --pkgs | grep org.python.Python 
pkgutil --pkgs | grep org.python.Python >> /Users/lukehowsam/python-log.txt # put your username here
pip3 install docutils
pip3 installl pipenv