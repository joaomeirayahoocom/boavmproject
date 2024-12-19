# Role assignment to storage account
resource "azurerm_role_assignment" "storage_account" {

  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "storage_account_container" {

  scope                = var.scope_ct
  role_definition_name = var.role_definition_name_ct
  principal_id         = var.principal_id
}