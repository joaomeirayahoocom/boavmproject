
output "storage_account_id" {
   value = azurerm_storage_account.azlz.id
}

output "storage_account_name" {
   value = azurerm_storage_account.azlz.name
}

output "storage_account_primary_connection_string" {
   value = azurerm_storage_account.azlz.primary_connection_string
}

