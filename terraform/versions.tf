provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "cms-iac-terraform-state"
    prefix = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    acl = "bucket-owner-full-control"
  }
}

