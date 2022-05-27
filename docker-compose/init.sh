#!/bin/sh



mkdir -p ./config ./config/transmission \
	 ./jackett ./radarr  \
	 ./config/sonarr \
	 ./portainer ./downloads

docker-compose up -d && docker-compose logs -f -t && docker ps
