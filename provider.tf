# resource "aws_dynamodb_table" "terraform_state_lock" {
#     name           = "terraform-state-lock"
#     hash_key       = "LockID"
#     read_capacity  = 20
#     write_capacity = 20
#     attribute {
#         name = "LockID"
#         type = "S"
#     }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "local-aws-bucket"
    key            = "aws-eks/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
    #access_key = var.aws_access_key
    #secret_key = var.aws_secret_key
}