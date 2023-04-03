# Setting Up a Docker Environment and Deploying a Containerized Application on AWS EC2 Using Terraform

### Objective:
As a DevOps Engineer, your task is to set up a Docker environment on an AWS EC2 instance 
using Terraform and deploy a containerized application using Docker CLI. 
You will create a basic Terraform configuration file that provisions an EC2 instance, 
installs Docker, and configures the instance for remote SSH access. 
Then, you will complete the Hands-On Docker Networking and Container Deployment exercise on the EC2 instance.

### Requirements:

#### Part 1: AWS EC2 Instance Setup with Docker (50 points)

1. Create an AWS EC2 instance using Terraform with the following specifications:
    - Use Amazon Linux 2 as the base AMI.
    - Accept the instance type as a variable (default to t2.micro).
    - Use an existing key pair for SSH access (name should be provided as a variable).

1. Use a ```user_data.sh``` script to set up the Docker environment on the EC2 instance:
    - Install Docker.
    - Start and enable the Docker service.
    - Add the ```ec2-user``` to the Docker group.

1. Configure the security group to allow SSH access from any IP address (0.0.0.0/0).

1. Provide the public IP address of the instance as an output.

1. Provide an SSH connection command as an output (replace the ```key_pair_name``` and ```public_ip``` with the actual values).

#### Part 2: Hands-On Docker Networking and Container Deployment (50 points)

1. SSH into the EC2 instance using the provided SSH connection command.

1. Follow the instructions provided in the "Hands-On Docker Networking and Container Deployment" exercise on the EC2 instance:

    - List and inspect Docker networks.
    - Identify the network of the `alpine-1` container.
    - Run the `alpine-2` container using the `none` network.
    - Create the `wp-mysql-network` network.
    - Deploy a MySQL container named `mysql-db` on the `wp-mysql-network` network.
    - Deploy a web application container named `webapp` on the `wp-mysql-network` network.
    -Test the application by accessing it using the public IP address of the EC2 instance.
1. After completing the exercise, clean up the containers and networks.

### Deliverables:

The `main.tf` file with the Terraform configuration.
The `variables.tf` file with variable definitions.
The `terraform.tfvars` file with the actual key pair name.
A screenshot or text output of the successful `terraform apply` command, showing the public IP address and SSH connection command.
A screenshot or text output of each step of the "Hands-On Docker Networking and Container Deployment" exercise.

### Evaluation Criteria:

The Terraform configuration file should be well-structured and easy to understand.
The EC2 instance should be created successfully with the specified settings.
The Docker environment should be set up correctly on the EC2 instance.
The security group should be configured to allow SSH access.
The SSH connection command should be provided as an output and should work correctly.
The "Hands-On Docker Networking and Container Deployment" exercise should be completed successfully, 
with screenshots or text output provided for each step.