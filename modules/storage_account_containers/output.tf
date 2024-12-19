output "storage_account_container_name" {
    
    value = azurerm_storage_container.azlz.name
}

output "id" {
    
    value = azurerm_storage_container.azlz.resource_manager_id
}