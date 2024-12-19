
#Creates Subnet
resource "azurerm_subnet" "vm" {

  name                 = "sub-web-vm-01"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.62.118.0/25"]
}


/*
resource "azurerm_subnet" "azlz_core" {

  name                = "cgaz-prod-azlz-sub-02"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.azlz.name
  address_prefixes     = ["10.62.118.128/25"]
  #private_endpoint_network_policies_enabled = true

  depends_on           = [azurerm_virtual_network.azlz]
}

resource "azurerm_subnet_network_security_group_association" "azlz_core_sub1" {

  subnet_id                 = azurerm_subnet.azlz_core_pl.id
  network_security_group_id = var.network_security_group_id

  depends_on              = [azurerm_virtual_network.azlz]
}
resource "azurerm_subnet_network_security_group_association" "azlz_core" {

  subnet_id                 = azurerm_subnet.azlz_core.id
  network_security_group_id = var.network_security_group_id

  depends_on              = [azurerm_virtual_network.azlz]
}*/