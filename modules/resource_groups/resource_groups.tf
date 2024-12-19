resource "azurerm_resource_group" "rg" {

  for_each = {
    for key, value in var.resource_groups : key => value
  }

  location = each.value.location
  name     = each.value.name  
  tags     = each.value.tags

  provider = azurerm
}

