# Creates NSG
resource "azurerm_windows_virtual_machine" "web_vm1" {
  name                = var.web_vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = random_password.password.result
  network_interface_ids = var.network_interface_ids

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "random_password" "password" {
  length      = 25
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "azurerm_virtual_machine_extension" "web_server_install" {
  name                       = "wsi"
  virtual_machine_id         = azurerm_windows_virtual_machine.web_vm1.id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.8"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}