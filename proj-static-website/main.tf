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

resource "aws_s3_bucket" "aayush-webapp22" {
  bucket = "aayush-webapp22"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.aayush-webapp22.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#  Changing the bucket Policy
resource "aws_s3_bucket_policy" "aayush-webapp22" {
  bucket = aws_s3_bucket.aayush-webapp22.id
  policy = jsonencode(
    {
    Version =  "2012-10-17",
    Statement = [
        {
            Sid= "PublicReadGetObject",
            Effect= "Allow",
            Principal= "*",
            Action= "s3:GetObject"
            Resource = "arn:aws:s3:::${aws_s3_bucket.aayush-webapp22.id}/*"

        }
    ]
}
  )
}

#  Website Configuration
resource "aws_s3_bucket_website_configuration" "aayush-webapp22" {
    bucket = aws_s3_bucket.aayush-webapp22.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.aayush-webapp22.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.aayush-webapp22.bucket
  source = "./style.css"
  key = "style.css"
  content_type = "text/css"

}
resource "aws_s3_object" "app_js" {
  bucket = aws_s3_bucket.aayush-webapp22.bucket
  source = "./app.js"
  key = "app.js"
  content_type = "text/js"
}

output "name" {
  value = aws_s3_bucket_website_configuration.aayush-webapp22.website_endpoint
}