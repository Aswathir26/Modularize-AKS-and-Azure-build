resource "azurerm_kubernetes_cluster" "default" {
  name                    = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  sku_tier                = var.sku_tier
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = var.private_dns_zone_id
  

  default_node_pool {
    orchestrator_version   = var.node_orchestrator_version
    name                   = var.node_pool_name
    node_count             = var.node_count
    vm_size                = var.vm_size
    enable_auto_scaling    = var.enable_auto_scaling
    enable_host_encryption = var.enable_host_encryption
    max_count              = var.node_max_count
    min_count              = var.node_min_count
    enable_node_public_ip  = var.enable_node_public_ip
    max_pods               = var.node_max_pods
    vnet_subnet_id         = var.vnet_subnet_id
    only_critical_addons_enabled = var.only_critical_addons_enabled
  }
  identity {
    type = var.identity_type
  }
  tags = var.tags
}

