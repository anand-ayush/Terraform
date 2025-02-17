variable "region" {
  description = "Value of Region "
  default = "eu-north-1"
  type = string
}
variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
}