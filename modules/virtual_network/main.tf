# Creates Virtual Network 
resource "azurerm_virtual_network" "azlz" {

  name                 = var.vnet_name
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  address_space        = ["10.62.116.0/22"]
  dns_servers          = ["8.8.8.8", "4.4.2.2"]
}
