locals {

  private_dns_zones = {
 
    privatelink-blob-core-windows-net = "privatelink.blob.core.windows.net"
  }
}

resource "azurerm_private_dns_zone" "private_dns_zones" {

  for_each            = local.private_dns_zones
  name                = each.value
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_network_links" {
  
  for_each              = local.private_dns_zones
  name                  = "pdns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = each.value
  virtual_network_id    = var.azurerm_vnet_id
  
  depends_on            = [azurerm_private_dns_zone.private_dns_zones]
}

#Setup Private-Link
resource "azurerm_private_endpoint" "main" {

  name                   = "pep_dev_azlz_01"
  location               = var.resource_group_location
  resource_group_name    = var.resource_group_name
  subnet_id              = var.subnet_id

  private_dns_zone_group {

    name                 = "default"
    private_dns_zone_ids =  [azurerm_private_dns_zone.private_dns_zones["privatelink-blob-core-windows-net"].id]
  }

  private_service_connection {

    is_manual_connection           = false
    private_connection_resource_id = var.storage_account_id
    name                           = "psc_dev_azlz_01"
    subresource_names              = ["file"]
  }
}

data "azurerm_client_config" "core" {
}
