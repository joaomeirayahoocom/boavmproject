# Creates NSG


resource "azurerm_network_security_group" "azlz" {

  name                = var.nsg_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  /*
   security_rule {
    name                       = "AllowhttpsInbound"
    description                = "AllowhttpsInbound"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.2.0/24"
    destination_address_prefix = "*" 
  }
    security_rule {
    name                       = "Allow443httpsInbound"
    description                = "Allow443httpsInbound"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.1.4"
    destination_address_prefix = "*" 
  }*/
}
