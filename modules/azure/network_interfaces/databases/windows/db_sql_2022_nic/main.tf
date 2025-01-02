resource "azurerm_network_interface" "db_sql_2022_nic" {
  name                = var.nic_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.db_sql_2022_publicip.id
  }
}

resource "azurerm_public_ip" "db_sql_2022_publicip" {
  name                = "acceptanceTestPublicIp1"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  tags = {
    environment = "dev"
  }
}