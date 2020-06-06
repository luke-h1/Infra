# ansible automation 
This repository contains real world examples for Ansible playbooks, especially for Fedora and its downstream (RHEL), as well as modules that are not a part of Ansible's core distribution.

## Getting Started
If you have just found Ansible,Centos ubuntu or Fedora, you should start here:

 * [Fedora](http://www.fedoraproject.org)
 * [Ansible project](https://github.com/ansible/ansible) -- see the examples directory
 * [ubuntu](https://ubuntu.com/)
 * [centos](https://www.centos.org/) 


1. server-setup/centos.yml - contains playbook for setting up a Centos server 
2. workstation-setup/centos7.yml - setups Centos for workstation use 
3. workstation-setup/fedora32.yml - setups Fedora for workstation use 
4. workstation-setup/ubuntu20.04.yml - setups Ubuntu for workstation use 






### Prerequisites
The setup of Ansible is explained on the 
[Ansible Getting Started](http://ansible.cc/docs/gettingstarted.html) page. 
Here is only the setup of the managed nodes covered. For every system you want
to manage, you need to have the client's SSH key in the *authorized_keys* file
of the management system and Python. Make sure that [Python](http://www.python.org/) is installed. If not, install
the Python package.

Fedora & centos: 
```bash
$ sudo dnf -y install python
```
```bash 
$ sudo yum install -y ansible 
```
ubuntu / debian: 
```bash 
$ sudo apt-get install -y ansible 
$ sudo apt-get install -y python 
``` 
## Quick setup 
```
git checkout https://github.com/luke-h1/ansible-automation
cd ~/ansible-automation 
sudo ansible-playbook  -u <your_user> --ask-pass -K -K -vvv <playbook_name>
# -K -K = elevate to sudo 
# --ask-pass = ask for SSH & BECOME password 
# -vvv = verbose output 
```


## Authors
* **luke howsam** 

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details



