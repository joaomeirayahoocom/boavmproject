terraform {
   required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
   
       backend "local" {
  }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}

provider "random" {}

provider "aws" {
  region  = var.aws_region
  shared_credentials_file = "C:\\Users\\joaomeira\\.aws\\credentials"
  profile = "default"
}

