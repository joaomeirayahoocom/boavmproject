resource "azurerm_windows_virtual_machine" "db_mysql_vm1" {
  name                = var.web_vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_B1s"
    plan {
      name = "mysql-windows-server-2022"
      publisher = "cloud-infrastructure-services"
      product = "mysql-2019"
      
      
    }
  admin_username      = "adminuser"
  admin_password      = random_password.password.result
  network_interface_ids = var.network_interface_ids

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
    publisher = "cloud-infrastructure-services"
    offer     = "mysql-2019"
    sku       = "mysql-windows-server-2022"
    version   = "latest"

  } 
}

resource "azurerm_marketplace_agreement" "my_image_agreement" {
  
  publisher = "cloud-infrastructure-services"
  offer     = "mysql-2019"
  plan      = "hourly"
}

resource "random_password" "password" {
  length      = 25
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

