#!/bin/sh
set -e -u

# Setup variables
basedir=$(pwd)/docker
composefile=$basedir/docker-compose.yml

# Stop the environment
docker-compose -f "$composefile" down

# Clean up
rm -rf  $basedir/_cache/data