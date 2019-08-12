#!/bin/bash
docker rm $(docker ps -aq)
docker rmi $(docker images --filter "dangling=true" -q)
docker volume rm $(docker volume ls -q)
