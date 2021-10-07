#!/bin/bash 

echo "what port do you want to free?"
read -r PORT 

sudo kill -9 $(sudo lsof -t -i:$PORT)
echo "Killed process running on $PORT"
