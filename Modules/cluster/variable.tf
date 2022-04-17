variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "MYPROJECT"
}
variable "node_resource_group" {
  description = "The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure Region where the Cluster should exist. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "westus2"
}

variable "cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type        = string
}

variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "dns_prefix" {
  description = " DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  type        = string
  default     = "k8s-PROJECT"
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free"
  default     = "Free"
  type        = string
}

variable "private_cluster_enabled" {
  description = "(Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? Defaults to false"
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning."
  default     = null
  type        = string
}


variable "node_pool_name" {
  description = "The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count."
  type        = number
  default     = 1
}


variable "vm_size" {
  description = "The size of the Virtual Machine, such as Standard_DS2_v2."
  type        = string
  default     = "Standard_D2_v2"
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where this Node Pool should exist"
  type        = string
  default     = null
}

variable "node_orchestrator_version" {
  description = "(Optional) Version of Kubernetes used for the Default node pool. If not specified, kubernetes_version specified will be used."
  type        = string
  default     = null
}

variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = true
}
variable "enable_host_encryption" {
  description = "(Optional) Enable host encryption"
  type        = bool
  default     = false
}

variable "node_max_count" {
  description = "Maximum number of nodes in a pool"
  type        = number
  default     = null
}
variable "node_min_count" {
  description = "Minimum number of nodes in a pool"
  type        = number
  default     = null
}
variable "enable_node_public_ip" {
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  type        = bool
  default     = false
}

variable "only_critical_addons_enabled" {
  description = "(Optional) Enabling this option will taint default node pool with CriticalAddonsOnly=true:NoSchedule taint. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "node_max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = 100
}

variable "tags" {
  description = " A mapping of tags to assign to the resource"
  type        = map(any)
  default     = {}
}

variable "identity_type" {
  description = ""
  type        = string
  default     = "SystemAssigned"
}

#network_profile
variable "network_plugin" {
  description = "(Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
  type        = string
  default     = "kubenet"
}

variable "load_balancer_sku" {
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. Defaults to Standard."
  default     = "Standard"
  type        = string
}





