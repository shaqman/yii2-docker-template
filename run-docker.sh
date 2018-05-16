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
docker-compose -f "$composefile" -p ab-tms-dev up -d --remove-orphans
docker exec --interactive --tty ab_nginx_frontend bash

