provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "cw-log-exporter-terraform-tfstate"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
