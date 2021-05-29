# Deploy with dokku to Digital ocean / AWS EC2 instance 

&nbsp;

### This deployment example uses Postgres, Redis & Node 


&nbsp;

**VPS**
- create new VPS with dokku image or install dokku yourself 
- go to VM IP addr in browser
- check virtual hosts option
- ssh into VPS
- run `dokku apps:create <API_NAME>`
- run `sudo dokku plugin:install <https://github.com/dokku/dokku-postgres.git`>
- run `dokku postgres:create <DATABASE_NAME>`
- run `dokku postgres:link <DATABASE_NAME> <API_NAME>`
- Install redis: `sudo dokku plugin:install <https://github.com/dokku/dokku-redis.git`>
- create redis instance: `sudo dokku redis:create <REDIS_INSTANCE_NAME>`
- run `dokku redis:link <REDIS_INSTANCE_NAME> <API_NAME>`
- run `docker container list` & make postgres & redis are running


**Locally** 
* comment out old migrations 
* Generate base DB tables 
* Create a repository on Docker hub 
* Create a Dockerfile image locally (this will be responsible for building & running the for production)
* Push the Docker image up to Docker hub


**VPS** 
* Pull the Docker image you've pushed up to Docker hub: `docker pull <USERNAME>/<API_NAME>`
* Tag the docker image: docker tag <USERNAME>/<API_NAME>:<VERSION> dokku/<API_NAME>:latest
* Deploy the image: `dokku tags:deploy <API_NAME> latest`
* Go to DNS provider
* Go to advanced DNS records 
* Add a new A record (the IP address of VPS / EC2 instances)
* the host name should match the name of whatever you named it via dokku 
* set TTL to automatic 
* let the DNS propagate (10 - 20 mins max)
* Now we will need to setup letencrypt + a cron job for its renewal in order to enable HTTPS
* install letsencrypt: `dokku config:set --no-restart <API_NAME> DOKKU_LETSENCRYPT_EMAIL=<YOUR_EMAIL_ADDR>`
* Now we will need to setup the domain for the API. By default dokku will assume it's the name of the VPS / EC2 instance. So we will need to get rid of this: 
* `dokku domains:remove-global <NAME_OF_VPS/EC2_HOST>`
* `dokku domains:remove <API_NAME> <VPS NAME>  (DOMAIN APP VHOSTS)`
* Once that's done we need to check if it's removed: 
* `dokku domains:report`
* If it's not removed repeat the above steps / check the docs
* If it is removed let's continue to add a custom domain name: 
* `dokku domains:add <API_NAME> <DOMAIN_NAME>`
* Check the ports: `dokku proxy:ports <API_NAME>`
* Assign the ports to the API name. This should match whatever you've exposed in your Docker image
* dokku proxy:ports-add <API_NAME> http:80:<PORT_IN_DOCKER_IMAGE>
* At this point you should be able to get access via the browser (cannot get / message). You may get a 502 response from the server if DNS hasn't finished propogating.
* Now that we've assigned a domain name, configured the correct ports, we can enable let's encrypt:  `dokku letsencrypt:enable <API_NAME>`
* At the point of enabling letencrypt you may get some errors about the domain name. If so check if your advanced DNS config is correct
* build fresh docker image on server & push to docker hub
* Tag the new release: `docker tag <USERNAME>/<API_NAME>:<VERSION> dokku/<API_NAME>:latest`
* Deploy the API to production: `dokku tags:deploy <API_NAME> latest`


**Frontend**
* Add a URL redirect to your DNS config to the main domain name (assuming you've setup a sub domain such as `api.yourdomainname.com` for the API).
* Add the following A record to your DNS config: `A Record @ <VERCEL_A_RECORD_ADDR> Automatic`
* Make sure frontend has .env variables correctly setup 
* Deploy frontend 
* Wait for DNS to propagate 
* All done. Your API, DB & Frontend should now be successfully deployed