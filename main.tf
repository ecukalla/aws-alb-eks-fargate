terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.54.1"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}


module "network" {
  source = "./modules/network/"
  availability_zones = data.aws_availability_zones.available.names
}