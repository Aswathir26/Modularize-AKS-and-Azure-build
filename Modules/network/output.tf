output "subnets" {
  value       = azurerm_virtual_network.default.subnet
  description = "One or more subnet blocks as defined below"
}