terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "myserver" {
  ami = "ami-0249211c9916306f8"
  instance_type = "t3.micro" 

  tags = {
    Name = "SampleServer"
  }
}

