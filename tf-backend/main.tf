terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }

  backend "s3" {
    bucket = "aaayush-bucket88"
    key = "backend.tfstate"
    region = "eu-north-1"
  }
}
provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0249211c9916306f8"
  instance_type = "t3.micro" 

  tags = {
    Name = "SampleServer"
  }
}

