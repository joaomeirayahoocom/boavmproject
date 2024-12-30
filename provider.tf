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
  #skip_provider_registration = true
}

#provider "oci" {
 # tenancy_ocid        = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
 # region              = "us-sanjose-1"
  #config_file_profile = "C:\\Users\\joaomeira\\.oci\\confcdbbig.txt"
#}


provider "oci" {
  tenancy_ocid     = var.tenancy_ocid 
  region           = var.region
}



provider "random" {}

provider "aws" {

  region  = var.aws_region
  shared_credentials_files = ["C:\\Users\\joaomeira\\.aws\\credentials"]
}

