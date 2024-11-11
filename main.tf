terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }

  backend "s3" {
    bucket = "backend-terraform-scada"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}