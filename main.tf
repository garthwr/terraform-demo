terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-bucket-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "My bucket"
    Environment = "prd"
  }
}

data "aws_caller_identity" "current" {}
