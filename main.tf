provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "pm1" {
  ami = var.ami["centos8"]
  availability_zone = var.zone
  instance_type = var.instance_size["xlarge"]
  key_name = var.key_pair_name
  root_block_device {
    volume_size = "100"
  }
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "pm1"
  }
}

resource "aws_instance" "pm2" {
  ami = var.ami["centos8"]
  availability_zone = var.zone
  instance_type = var.instance_size["xlarge"]
  key_name = var.key_pair_name
  root_block_device {
    volume_size = "100"
  }
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "pm2"
  }
}

resource "aws_instance" "pm3" {
  ami = var.ami["centos8"]
  availability_zone = var.zone
  instance_type = var.instance_size["xlarge"]
  key_name = var.key_pair_name
  root_block_device {
    volume_size = "100"
  }
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "pm3"
  }
}

resource "aws_instance" "mx1" {
  ami = var.ami["centos8"]
  availability_zone = var.zone
  instance_type = var.instance_size["medium"]
  key_name = var.key_pair_name
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "mx1"
  }
}
