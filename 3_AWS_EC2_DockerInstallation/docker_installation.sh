#!/bin/bash

# Install Docker on Amazon Linux 2 EC2 Instance
echo Installing docker...
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
echo "Adding ec2-user to docker group. You have to relog to make this work"
sudo usermod -a -G docker ec2-user
newgrp docker

#status of docker
echo You can check status of docker service with:
echo sudo systemctl status docker

echo "Current storage driver is: (be worried if its not overlay2)"
sudo docker info | grep Storage\ Driver