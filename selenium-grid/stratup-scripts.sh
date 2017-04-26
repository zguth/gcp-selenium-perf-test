#!/bin/bash

apt-get update
apt-get install -y docker.io docker-compose

mkdir /usr/lib/selenium-grid-docker 
git clone https://github.com/zguth/gcp-selenium-perf-test.git /usr/lib/selenium-grid-docker 

cd /usr/lib/selenium-grid-docker/selenium-grid
docker-compose up
