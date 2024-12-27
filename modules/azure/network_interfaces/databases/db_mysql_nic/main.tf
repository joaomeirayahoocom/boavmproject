resource "azurerm_network_interface" "db_mysql_nic" {
  name                = var.nic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.my_terraform_public_ip.id
  }
}

