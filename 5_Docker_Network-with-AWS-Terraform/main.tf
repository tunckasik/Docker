terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region                 = var.region
}

data "template_file" "userdata" {
  template = file("${abspath(path.module)}/userdata.sh")
}

resource "aws_instance" "ec2" {
  ami                    = var.ami_type
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
user_data = data.template_file.userdata.rendered
  tags = {
    Name = var.ec2_tag
  }

  provisioner "file" {
    source      = file("${abspath(path.module)}/userdata.sh")
    destination = "/"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

locals {
  ingress_ports = [22, 8080, 443]
}

resource "aws_security_group" "sg" {
  name = "${var.prefix}-sg"

  dynamic "ingress" {
    for_each = local.ingress_ports
    iterator = port
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}