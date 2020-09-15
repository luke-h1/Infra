#!/bin/bash


# simple bash script to remove all of robot framework's logging. 
# run with caution ❌ 
# run inside the dir you want to get rid of the logs 

for dir in ./*/ 
do cd -P "$dir" || continue 
	printf %s\\n "$PWD" >&2 
	sudo rm -rf *.html *.xml *.log && cd "$OLDPWD" || 
		! break; done || ! cd - >&2 
