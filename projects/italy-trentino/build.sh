#!/bin/bash
set -x

# create directories
#mkdir -p /home/z4k/www/pelias/code 
#mkdir -p /data
#mkdir -p /mnt/pelias
# set proper permissions. make sure the user matches your `DOCKER_USER` setting in `.env`
#chown z4k:z4k /home/z4k/www/pelias/code /data /mnt/pelias

# install pelias script
#ln -s "$(pwd)/pelias" /usr/local/bin/pelias

# cwd
#cd projects/italy-trentino

# configure environment
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=/data' >> .env

sed -i '/PELIAS_CONFIG/d' .env
echo 'PELIAS_CONFIG=/home/z4k/www/pelias/docker/projects/italy-trentino/pelias.json' >> .env

#download pelias docker images
#pelias compose pull

pelias elastic start
pelias elastic wait
#reset
pelias elastic drop

pelias elastic create
# #pelias download all
pelias prepare all
pelias import all
pelias compose up

# optionally run tests
#pelias test run
