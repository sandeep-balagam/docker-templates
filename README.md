# Magento Docker Template
Setup Magento Vanilla Instance on Docker with Apache, MySQL, PhpMyAdmin, OpenSearch and Xdebug
To use with https and http2, you may need to generate SSL

## To create a vanilla instance
Create folder name - `magento`, place `composer.json` file in it with required magento version and start the containers

## To dockerise an existing magento application
Pull the code into folder - `magento` and start the containers

## Generate SSL
Run below script file to generate `docker.crt` and `docker.key` which will be used by Apache. Adjust the CN and subjectAltName as required
`.docker/ssl/openssl_generate.sh`

## Init Database
To import any SQL dump, place it under `.docker/mysql/init`. If multiple files are placed, imports are done in alphabetical order

## Start Containers
`docker compose up -d`

## Stop Containers
`docker compose down`

## Stop Containers and remove volumes
`docker compose down -v`

## Rebuild Containers
`docker compose up -d --build`

## Rebuild single container
`docker compose up -d --build <container-name>`

## Check Status of containers
`docker ps -a`

## Login to a container as default user
`docker exec -it <container-name> bash`

## Login to a container as root user
`docker exec -it -u 0 <container-name> bash`
