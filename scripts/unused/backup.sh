#!/bin/bash

# tar backup script 

if [[ $1 == "y" ]];
then
	echo "starting backup..." 
	
	echo -n "enter name of backup : " 
	
	read name 
	
	echo -n "enter directory you want to be backed up: " 
	
	read source 
	
	echo -n "where do you want the backup to be saved ? : " 
	
	read dest 
	
	echo "backing up now..." 

	tar -cvzf $dest/$name.tar.gz $source  

echo "***********************backup done**************************************************" 

elif [[ $1 == "n" ]];
then
	echo "exiting..." 
	exit 5 
else
	echo "enter a correct response [y/n]" 
fi 

