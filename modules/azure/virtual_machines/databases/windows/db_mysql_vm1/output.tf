

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.db_mysql_vm1.admin_password
}
