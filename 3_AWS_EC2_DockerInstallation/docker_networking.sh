#!/bin/bash

# After installing Docker on EC2
echo Checking whether the docker service is actively running or not..
systemctl status docker | grep -A 1 -B 1 active

docker container run -dit --name bronze1st alpine ash
docker container run -dit --name bronze2nd alpine ash
echo Running two alpine containers with interactive shell, in detached mode

docker ps
docker network inspect bridge | grep -B 3 IPv4
docker container inspect bronze2nd | grep IPAddress

# Connect to the bronze1st container.
docker container attach bronze1st
ifconfig
ping -c 4 google.com
ping -c 4 172.17.0.3

# Due to default bridge configuration not works with container 
# ping -c 4 bronze2nd will not work.
# Disconnect from clarus1st without stopping it (CTRL + p + q).

docker container stop bronze1st bronze2nd
docker container rm bronze1st bronze2nd