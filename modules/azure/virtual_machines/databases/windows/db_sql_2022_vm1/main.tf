resource "azurerm_windows_virtual_machine" "db_vm1" {

  name                = var.web_vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = random_password.password.result
  network_interface_ids = var.network_interface_ids
 
  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    
    
  }
 
  source_image_reference {
    publisher = "microsoftsqlserver"
    offer     = "sql2022-ws2022"
    sku       = "sqldev-gen2"
    version   = "latest"
    
    }
  
  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.tcs.primary_blob_endpoint
  }

  

  enable_automatic_updates = true
  provision_vm_agent = true
}

resource "random_password" "password" {
  length      = 25
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

data "azurerm_storage_account" "tcs" {

   name                  = "tcsprojecttfste"
   resource_group_name   = "tfstate_tcss_torage"
}

 resource "azurerm_virtual_machine_extension" "AzureMonitorwindowsAgent" {        
  name                       = "slqdbvm1"
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.14"
  auto_upgrade_minor_version = "true"
  virtual_machine_id = azurerm_windows_virtual_machine.db_vm1.id
  
}
# Create Log Analytics Workspace
/*
resource "azurerm_log_analytics_workspace" "my_log_analytics_workspace" {

  name                = "my-log-analytics-workspace"

  resource_group_name = "my-resource-group"

  location            = "westus"

}



# Create Data Collection Rule

resource "azurerm_monitor_data_collection_rule" "vm_insights_dcr" {
  name                = "vm-insights-dcr"
  resource_group_name = "my-resource-group"
  location            = "westus2"

  data_flow {

    streams = ["Microsoft-InsightsMetrics"]
    destinations = ["log-analytics-workspace-destination"]
  }

  data_sources {

    performance_counter {

      counter_specifiers = ["\\Processor\\% Processor Time", "\\Memory\\Available Bytes"]
      sampling_frequency_in_seconds = 60
    }
  }
}

*/




