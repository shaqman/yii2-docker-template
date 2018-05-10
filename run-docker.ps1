# Setup variables
$basedir=$PSScriptRoot + "\docker"
$composefile=$basedir + "\docker-compose.yml"

# Prepare environment
$path = $basedir + "\_cache\cache"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

$path = $basedir + "\_cache\data"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

$path = $basedir + "\_cache\composer"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

# Start the environment
# docker-compose -f "$composefile" stop
docker-compose -f "$composefile" up --no-recreate -d
# docker exec ae_nginx composer update
docker exec --interactive --tty ae_nginx bash

