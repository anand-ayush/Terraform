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

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "aaayush-bucket95"
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.demo-bucket.bucket
  source = "./myFile.txt"
  key = "mydata.txt"
}