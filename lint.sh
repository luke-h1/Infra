#!/bin/bash
sudo apt-get install -y pip 
pip install ansible-lint 
# ansible-lint macbook/mac-catalina.yml -x 303,701,601,206,602,403,301,502,306,208,201 -v


# name: CI

# on:
#   push:
#     branches: [ dev ]
#   pull_request:
#     branches: [ dev ]

#   workflow_dispatch:

# jobs:
#   lint:
#     runs-on: ubuntu-latest
#     steps:
#       - uses: luke-h1/checkout@v2

#       - name: Run ansible lint 
#         run: lint.sh
