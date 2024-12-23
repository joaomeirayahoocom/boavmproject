resource "azurerm_storage_account" "azlz" {
  
  name                     = "inceptionazlzsa"
  resource_group_name      = var.storage_account_rg_name
  location                 = var.storage_account_rg_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 # add network rules

}

/*
data "azurerm_storage_account_sas" "example" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2024-06-21T00:00:00Z"
  expiry = "2024-09-21T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}*/



