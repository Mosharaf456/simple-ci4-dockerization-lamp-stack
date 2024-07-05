#!/bin/bash +x

# Docker repository credentials
DOCKER_USERNAME="mosharafhossain"
DOCKER_PASSWORD="*Mosharaf11"

# Log in to Docker repository
echo ${DOCKER_PASSWORD} | docker login --username ${DOCKER_USERNAME} --password-stdin

# Define image names and tags
MYSQL_IMAGE_NAME="mysql-db-cus-image"
MYSQL_TAG="v1.0.1"
MYSQL_REPO="mosharafhossain/mysql-db-cus-image:latest"

PHP_IMAGE_NAME="web-ci4-cus-image"
PHP_TAG="v1.0.1"

PHP_REPO="mosharafhossain/ci4-custom-web-img:v.1.0.1"

# Build images
docker-compose build 

# Tag images
docker tag ${MYSQL_IMAGE_NAME}:${MYSQL_TAG} ${MYSQL_REPO}
docker tag ${PHP_IMAGE_NAME}:${PHP_TAG} ${PHP_REPO}

# Push images to the repository
docker push ${MYSQL_REPO}
docker push ${PHP_REPO}

# docker push mosharafhossain/ci4-docker-custom-img:tagname

