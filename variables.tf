variable "access_key" {
  type = string
  default = "your_access_key"   # Change Me
}

variable "secret_key" {
  type = string
  default = "your_secret_key"   # Change Me
}

variable "region" {
  type = string
  default = "us-west-2"
}

variable "zone" {
  type = string
  default = "us-west-2a"
}

variable "vpc" {
  type = string
  default = "your_vpc"   # Change Me
}

variable "ami" {
  type = map
  default = {
      "centos7" = "ami-0bc06212a56393ee1"
      "centos8" = "ami-03ef3eebb80538c74"
  }
}

variable "instance_size" {
  type = map
  default = {
      "small" = "t2.small"
      "medium" = "t2.medium"
      "large" = "t2.large"
      "xlarge" = "t2.2xlarge"
  }
}

variable "key_pair_name" {
  type = string
  default = "your_key_pair"   # Change Me
}

variable "security_group" {
  type = string
  default = "your_security_group"   # Change Me
}
