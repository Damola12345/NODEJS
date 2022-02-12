terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72.0"
    }
  }
   cloud {
    organization = "arterycloud"
    workspaces {
      name = "nodejs-api"
    }
  }
}

# Configured AWS Provider with Proper Credentials
# terraform aws provider
provider "aws" {
  region    = "us-east-1"
  profile   = "Terraform-user"
}