# Magento Docker Template
Setup Magento on Docker with Nginx, PHP-FPM, MySQL, PhpMyAdmin, OpenSearch and Xdebug
To use with https and http2, you may need to generate SSL

## To dockerise an existing magento application
Pull the code into folder - `magento` before starting the containers

## Generate SSL
Run below script file to generate `docker.crt` and `docker.key` which will be used by Nginx for SSL. Adjust the CN and subjectAltName as required
`.docker/ssl/openssl_generate.sh`

## Init Database
To import any SQL dump, place it under `.docker/mysql/init` replacing the `2-db.sql`. If multiple files are placed, imports are done in alphabetical order. Adjust the init files naming accordingly

## Configure Database: Optional
Required DB configurations are updated from `3-config.sql`. Update any changes as required in `3-config.sql` or manually update DB - `core_config_data` table for `base_url`, `search/engine`

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

## Access Magento Website
Browse https://localhost:8001 for frontend. For Admin, Browse https://localhost:8001/admin

## Access PhpMyAdmin
Browse http://localhost:8336