resource "azurerm_resource_group" "default" {
  name     = "rg-${terraform.workspace}"
  location = local.location
}

data "azurerm_kubernetes_service_versions" "current" {
  location        = local.location
  include_preview = false
}

module "cluster" {
  source                    = "../Modules/cluster"
  resource_group_name       = azurerm_resource_group.default.name
  location                  = "northcentralus"
  cluster_name              = "aks-cluster-${terraform.workspace}" 
  kubernetes_version        = local.cluster_input["kubernetes_version"]
  dns_prefix                = "k8s-nets-${terraform.workspace}"
  sku_tier                  = local.cluster_input["sku_tier"]
  node_count                = local.cluster_input["node_count"]
  vm_size                   = local.cluster_input["vm_size"]
  node_orchestrator_version = local.cluster_input["node_orchestrator_version"]
  enable_auto_scaling       = local.cluster_input["enable_auto_scaling"]
  enable_host_encryption    = local.cluster_input["enable_host_encryption"]
  enable_node_public_ip     = local.cluster_input["enable_node_public_ip"]
  node_max_pods             = local.cluster_input["node_max_pods"]
  vnet_subnet_id            = element(module.network.subnets[*].id, 0)
  tags                      = local.cluster_input["tags"]
  identity_type             = local.cluster_input["identity_type"]

}

module "network" {
  source = "../Modules/network"

  resource_group_name    = azurerm_resource_group.default.name
  location               = "northcentralus"
  security_group_name    = "sg-${terraform.workspace}-default"
  virtual_network_name   = "vnet-${terraform.workspace}"
  addr_space             = local.network_input["addr_space"]
  subnet1_name           = "snet-${terraform.workspace}-aks"
  subnet2_name           = "snet-${terraform.workspace}-default"
  subnet1_address_prefix = local.network_input["subnet1_address_prefix"]
  subnet2_address_prefix = local.network_input["subnet2_address_prefix"]
}

module "mysql" {
  source = "../Modules/mysql"

  mysql_server_name                = local.sql_input["mysql_server_name"]
  resource_group_name              = local.sql_input["resource_group_name"]
  # location                         = local.sql_input["location"]
  administrator_login              = "mysqladmin"
  # administrator_login              = local.sql_input["administrator_login"]
  administrator_login_password     = local.sql_input["administrator_login_password"]
  sku_name                         = local.sql_input["sku_name"]
  storage_mb                       = local.sql_input["storage_mb"]
  vers                             = local.sql_input["vers"]
  auto_grow_enabled                = local.sql_input["auto_grow_enabled"]
  backup_retention_days            = local.sql_input["backup_retention_days"]
  geo_redundant_backup_enabled     = local.sql_input["geo_redundant_backup_enabled"]
  public_network_access_enabled    = local.sql_input["public_network_access_enabled"]
  ssl_enforcement_enabled          = local.sql_input["ssl_enforcement_enabled"]
  ssl_minimal_tls_version_enforced = local.sql_input["ssl_minimal_tls_version_enforced"]
  mysql_database_name              = local.sql_input["mysql_database_name"]
  charset                          = local.sql_input["charset"]
  collation                        = local.sql_input["collation"]

}