
## Prerequsites : 
* Install Git to clone this repostiroy (v2 or higher)
* run the ubuntu.sh script first as this will install Ansible + node which if left uninstalled will cause the playbook to fail


## Commands: 

```
sudo ansible-playbook -u <your-username> -K -K --ask-pass -vvv ubuntu.yml 
```

```
sudo chmod 770 ubuntu.sh 
./ubuntu.sh
```
