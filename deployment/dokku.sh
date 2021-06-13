#!/bin/bash
echo What should the version be ?
read VERSION
echo Enter IP address
read TARGET
echo Enter user 
read USER 

echo "Deploying to production 🚀 🔥"

docker build -t lhowsam/<API_NAME>:$VERSION .
docker push lhowsam/<DOCKER_IMAGE>:$VERSION
ssh ${USER}@${TARGET} -i /Users/lukehowsam/aws/*.cer "sudo docker pull lhowsam/<DOCKER_IMAGE>:$VERSION && sudo docker tag lhowsam/<DOCKER_IMAGE>:$VERSION dokku/<API_NAME>:$VERSION && dokku deploy <API_NAME> $VERSION"
