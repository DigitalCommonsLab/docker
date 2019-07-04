
# Trentino geocoder
This project is configured to download/prepare/build a complete Pelias installation for Trentino Alto Adige in Italy

# Setup
Please refer to the instructions at https://github.com/pelias/docker in order to install and configure your docker environment.

The file *.env* contains custom ENV variable passed to docker compose to specify
data working directory and docker connection parameters:
```
COMPOSE_PROJECT_NAME=pelias
DOCKER_USER=1000
DOCKER_HOST=unix:///var/run/docker.sock
DATA_DIR=/data
PELIAS_CONFIG=/var/www/pelias/docker/projects/italy-trentino/pelias.json
```
*PELIAS_CONFIG* is absolute path di locate pelias config file

# Run a Build
To run a complete build configure and execute the script *build.sh*
or the following commands separately:

first time or reset database
```bash
pelias compose pull
pelias elastic start
pelias elastic wait
#pelias elastic drop if you want reset data
pelias elastic create
```

Download and import Trentino Opendata House Numbers
```bash
pelias download wof
pelias download osm
pelias download transit
pelias download trentino
pelias prepare trentino
pelias prepare polylines #if you want use street names by osm
pelias prepare interpolation
pelias prepare placeholder
pelias import wof
pelias import osm
pelias import transit
pelias import oa 	#import trentino data
```

```bash
pelias import all
pelias compose up
```

## API CONFIG

defaults values:
https://github.com/pelias/config/blob/master/config/defaults.json
