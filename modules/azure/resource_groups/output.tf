# app resource group name and location output 
output "resource_group_name_app" {

  value = azurerm_resource_group.rg["app"].name
}

output "resource_group_location_app" {

  value = azurerm_resource_group.rg["app"].location
}

# db resource group name and location output 
output "resource_group_name_db" {

  value = azurerm_resource_group.rg["db"].name
}

output "resource_group_location_db" {

  value = azurerm_resource_group.rg["db"].location
}

# web resource group name and location output 
output "resource_group_name_web" {

  value = azurerm_resource_group.rg["web"].name
}

output "resource_group_location_web" {

  value = azurerm_resource_group.rg["web"].location
}

# vnet resource group name and location output 
output "resource_group_name_vnet" {

  value = azurerm_resource_group.rg["vnet"].name
}

output "resource_group_location_vnet" {

  value = azurerm_resource_group.rg["vnet"].location
}
# nsg resource group name and location output 
output "resource_group_name_nsg" {

  value = azurerm_resource_group.rg["nsg"].name
}

output "resource_group_location_nsg" {

  value = azurerm_resource_group.rg["nsg"].location
}
