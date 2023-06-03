## Download aws-nuke
wget -c https://github.com/rebuy-de/aws-nuke/releases/download/v2.22.1/aws-nuke-v2.22.1-darwin-amd64.tar.gz
## Extract the aws-nuke binary
tar -xvf aws-nuke-v2.22.1-darwin-amd64.tar.gz
## Rename the extracted binary to aws-nuke
mv aws-nuke-v2.22.1-darwin-amd64 aws-nuke
## Copy the extracted binary to your $PATH
sudo mv aws-nuke /usr/local/bin/aws-nuke
## Validate
aws-nuke -h

