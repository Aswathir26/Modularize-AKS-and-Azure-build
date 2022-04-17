locals {
  location = "westus2"
  cluster_input_raw = {
    dev = {
      kubernetes_version        = data.azurerm_kubernetes_service_versions.current.latest_version
      sku_tier                  = "Free"
      vm_size                   = "Standard_B2s"
      node_orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
      enable_auto_scaling       = false
      enable_host_encryption    = false
      node_count                = 1
      enable_node_public_ip     = false
      node_max_pods             = 100
      tags = {
        environment = "dev"
        project     = "MYPROJECT"
      }
      identity_type = "SystemAssigned"
    }

    test = {}
  }

  network_input_raw = {
    dev = {

      addr_space             = ["10.30.0.0/16"]
      subnet1_address_prefix = "10.30.1.0/24"
      subnet2_address_prefix = "10.30.2.0/24"
    }

    test = {}

  }

  mysql_input_raw = {
    dev = {
      mysql_server_name   = "server-mysqlserver"
      resource_group_name = "rg-dev"
      # location                         = local.location
      administrator_login              = "mysqladmin"
      administrator_login_password     = "H@Sh1CoR3!"
      sku_name                         = "B_Gen5_1"
      storage_mb                       = 5120
      vers                             = 5.7
      auto_grow_enabled                = true
      backup_retention_days            = 7
      geo_redundant_backup_enabled     = false
      public_network_access_enabled    = true
      ssl_enforcement_enabled          = true
      ssl_minimal_tls_version_enforced = "TLS1_2"
      mysql_database_name              = "netsdb"
      charset                          = "utf8"
      collation                        = "utf8_unicode_ci"
    }

    test = {}
  }

  
  cluster_input = local.cluster_input_raw[terraform.workspace]
  mysql_input   = local.mysql_input_raw[terraform.workspace]
  network_input = local.network_input_raw[terraform.workspace]
}