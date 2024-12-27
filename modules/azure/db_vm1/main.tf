# Creates NSG
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
}

resource "random_password" "password" {
  length      = 25
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}
