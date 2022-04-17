variable "security_group_name" {
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
  default     = "security-group"
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "MYPROJECT"
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "westus2"
}

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
  default     = "vpc"
}

variable "addr_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
  default     = []
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}

variable "subnet1_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet1"
}

variable "subnet1_address_prefix" {
  description = " The address prefix to use for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}
variable "subnet2_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet2"
}

variable "subnet2_address_prefix" {
  description = " The address prefix to use for the subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "tags_env" {
  description = ""
  type        = string
  default     = "PROJECT"
}

