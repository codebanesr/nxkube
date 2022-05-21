#!/bin/bash

docker-compose up -d

sleep 5

# docker exec container_name executable_file
docker exec mongo1 /scripts/rs-init.sh