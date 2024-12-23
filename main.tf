# Creates Resource Groups with tags
module "resource_groups" {

  source = "./modules/resource_groups" 

  resource_groups = var.resource_groups
}

# Creates Network Security Group (*resusable to existing resources)
module "network_security_group" {

  source = "./modules/network_security_group"

  resource_group_name       = module.resource_groups.resource_group_name_nsg
  resource_group_location   = module.resource_groups.resource_group_location_nsg

  depends_on = [module.resource_groups]
}

# Creates Virtual Network
module "virtual_network" {

  source = "./modules/virtual_network"

  resource_group_name       = module.resource_groups.resource_group_name_vnet

  resource_group_location   = module.resource_groups.resource_group_location_vnet
   
  network_security_group_id = module.network_security_group.network_security_group

  depends_on = [module.resource_groups, module.network_security_group]
}

module "subnets" {

  source = "./modules/subnets"

  resource_group_name       = module.resource_groups.resource_group_name_vnet

  resource_group_location   = module.resource_groups.resource_group_location_vnet

  virtual_network_name      = module.virtual_network.azurerm_vnet_name
   
  network_security_group_id = module.network_security_group.network_security_group

  depends_on = [module.resource_groups, module.network_security_group]
}

module "web_nic"{
  source = "./modules/web_nic"

  resource_group_location  = module.resource_groups.resource_group_location_web
  resource_group_name      = module.resource_groups.resource_group_name_web
  subnet_id                = module.subnets.vm_id
}

module "windows_web_vm1" {

  source = "./modules/web_vm1"

  resource_group_name     = module.resource_groups.resource_group_name_web
  resource_group_location = module.resource_groups.resource_group_location_web
  network_interface_ids   = [module.web_nic.web_nic_id]
}

module "app_nic"{
  source = "./modules/app_nic"

  resource_group_location  = module.resource_groups.resource_group_location_app
  resource_group_name      = module.resource_groups.resource_group_name_app
  subnet_id                = module.subnets.vm_id

}

module "windows_app_vm1" {

  source = "./modules/app_vm1"

  resource_group_name     = module.resource_groups.resource_group_name_app
  resource_group_location = module.resource_groups.resource_group_location_app
  network_interface_ids   = [module.app_nic.app_nic_id]
}

# Creates Storage Accounts Containers
module "storage_accounts" {

  source = "./modules/storage_accounts"

  storage_account_rg_name     = module.resource_groups.resource_group_name_sa 
  storage_account_rg_location = module.resource_groups.resource_group_location_sa

  depends_on = [module.resource_groups]
}

/*
# Creates Storage Account Container
module "storage_account_container" {

  source = "./modules/storage_account_containers"

  storage_account_name = module.storage_accounts.storage_account_name

  depends_on = [module.resource_groups, module.storage_accounts]
}

data "azurerm_client_config" "core" {
  provider = azurerm.core
}
# Creates Private Links
module "private_links" {

   source = "./modules/private_links"

   resource_group_name      = module.resource_groups.resource_group_name_pl
   resource_group_location  = module.resource_groups.resource_group_location_pl

   subnet_id                = module.subnets.azlz_core_pl_id
   azurerm_vnet_id          = module.virtual_network.virtual_network_id

   storage_account_id       = module.storage_accounts.storage_account_id
   snp_principal_id         = data.azurerm_client_config.core.id

   depends_on = [module.resource_groups,module.storage_accounts, module.virtual_network]
}

module "role_assignment" {

  source = "./modules/role_assignment"

  scope_ct                = module.storage_account_container.id
  role_definition_name_ct = "Storage Blob Data Contributor"

  scope                   = module.storage_accounts.storage_account_id
  role_definition_name    = "Storage Account Contributor" 

  principal_id            = data.azurerm_client_config.core.object_id
  
  depends_on = [module.storage_account_container, module.storage_accounts]
}
*/