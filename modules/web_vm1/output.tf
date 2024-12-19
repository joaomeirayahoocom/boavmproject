

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.web_vm1.admin_password
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.web_vm1.public_ip_addresses
}