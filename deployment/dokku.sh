#!/bin/bash

# Deploy with Dokku process: 
# Follow instructions in the dokku.md file

echo What should the version be ?
read VERSION

echo "Deploying to production 🚀"

docker build -t lhowsam/<API_NAME>:$VERSION
docker push lhowsam/<API_NAME>:$VERSION
ssh root@VPS "docker pull lhowsam/<API_NAME>:$VERSION && docker tag lhowsam/<API_NAME>:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"