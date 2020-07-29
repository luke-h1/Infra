<div style="background:rgba(0,0,0,0.5);padding:0.5em;">
<div style="background:rgba(0,0,0,0.5);padding:0.5em;">
<h2>Automation</h2>   

Simple Automation of Mac with Ansible + Bash 

### Prerequisites

Generally you will need to run the following commands in order to clone this repo & get Ansible up & running 

```
brew install git  
brew install ansible 
```


Ansible playbook command: 

```
ansible-playbook -u <your-username> -K -K --ask-pass -vvv <playbook-name> 
```

Bash script command: 
```
sudo chmod 770 mac-catalina.sh 
./mac-catalina.sh 
``` 


## Contributing
If you want to add your own feature or want to improve this repo feel free to open a pull request detailing your changes
1. Fork it 
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request detailing the changes made 


## alternatives: 
  * if you run a linux machine the <a href="https://github.com/luke-h1/linux-server-automation">this</a> repository may be helpful in automating your setup: 


## License
This project is licensed under the MIT License - 

permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

* **<luke-h1>** - *Initial work* - [luke-h1](https://github.com/luke-h1)

