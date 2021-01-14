
<div style="background:rgba(0,0,0,0.5);padding:0.5em;">
<div style="background:rgba(0,0,0,0.5);padding:0.5em;">

## Prerequsites : 
* Install Git to clone this repostiroy (v2 or higher)
* run the mac-catalina.sh script first as this will install homebrew, Ansible & Node which if left uninstalled will cause the playbook to fail. 


## Commands: 

```
ansible-playbook -u <your-username> -K -K --ask-pass -vvv <playbook-name> 
```

```
sudo chmod 770 mac-catalina.sh 
./mac-catalina.sh 
``` 
