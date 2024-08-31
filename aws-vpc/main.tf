terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
    region = "eu-north-1"
    # access_key = var.aws_access_key
    # secret_key = var.aws_secret_key
}

# Creating a VPC

resource "aws_vpc" "aayush-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aayush-vpc"
  }
}


# Private Subnet
resource "aws_subnet" "aayush-private-subnet" {
  vpc_id = aws_vpc.aayush-vpc.id
  cidr_block = "10.0.0.0/24"
    # availability_zone = "eu-north-1a"
    # map_public_ip_on_launch = false
    tags = {
    Name = "aayush-private-subnet"
    }
}



# Public Subnet



