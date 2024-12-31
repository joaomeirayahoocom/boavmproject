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
      version = "~>4.24.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "6.21.0"
    }
  }
       backend "local" {
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "7be51bf7-41bf-4959-8328-190bdd199051"
}

provider "oci" {
  config_file_profile = "DEFAULT"
}

provider "aws" {

  region  = var.aws_region
  shared_credentials_files = ["C:\\Users\\joaomeira\\.aws\\credentials"]
}

provider "random" {}



