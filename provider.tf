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
  skip_provider_registration = true
}

/*
provider "oci" {
    config_file_profile = "joaogmn"
    region           = "uswest"
}*/

provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaab2ljev5xrj45kya7qlx2rdwuw3ohal6puigrte4l6yz6zk7hunaa"
  user_ocid        = "ocid1.user.oc1..aaaaaaaaiyqgthwzg4xr33opi6nezfnwohp5a2kbtwgpn3htipxlmqg2cf5q"
  fingerprint      = "90:8a:b0:01:5f:6e:3e:f6:6a:db:0f:2a:70:95:e8:be"
  private_key_path = "C:\\Users\\joaomeira\\.oci\\oci_api_key.pem"
  region           = "us-sanjose-1"

}

provider "random" {}

provider "aws" {
  region  = var.aws_region
  shared_credentials_files = ["C:\\Users\\joaomeira\\.aws\\credentials"]
}

