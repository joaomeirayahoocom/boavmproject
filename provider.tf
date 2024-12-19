terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.74.0"
     # configuration_aliases = [azurerm.core,]
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
