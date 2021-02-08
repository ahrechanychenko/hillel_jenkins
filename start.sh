#!/bin/bash

echo "Creating jenkins_home directory"
mkdir jenkins_home
sudo chown -R 1000:1000 jenkins_home
docker-compose up -d
