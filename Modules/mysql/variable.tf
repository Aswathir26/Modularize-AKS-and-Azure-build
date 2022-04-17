variable "mysql_server_name" {
  description = "Specifies the name of the MySQL Server. Changing this forces a new resource to be created. This needs to be globally unique within Azure.."
  type        = string
  default     = "server-mysqlserver"
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "rg-dev"
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "East US"
}


variable "administrator_login" {
  description = "The Administrator Login for the MySQL Server."
  type        = string
  default     = "mysqladmin"
}

variable "administrator_login_password" {
  description = "The Password associated with the administrator_login for the MySQL Server. "
  type        = string
  default     = "H@Sh1CoR3!"
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MySQL Server."
  type        = string
  default     = "B_Gen5_2"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. "
  type        = number
  default     = 5120
}

variable "vers" {
  description = "Specifies the version of MySQL to use."
  type        = number
  default     = 5.7
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage."
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = " Backup retention days for the server"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this server. "
  type        = bool
  default     = true
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections."
  type        = bool
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The minimum TLS version to support on the sever."
  type        = string
  default     = "TLS1_2"
}