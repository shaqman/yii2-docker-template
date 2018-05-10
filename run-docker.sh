#!/bin/sh
set -e -u

# Setup variables
basedir=$(pwd)/docker
composefile=$basedir/docker-compose.yml

# Prepare environment
mkdir -p $basedir/_cache/cache
mkdir -p $basedir/_cache/data
mkdir -p $basedir/_cache/composer

# Start the environment
# docker-compose -f "$composefile" stop
docker-compose -f "$composefile" up --no-recreate -d
# docker exec ae_nginx composer update
docker exec --interactive --tty ae_nginx bash

