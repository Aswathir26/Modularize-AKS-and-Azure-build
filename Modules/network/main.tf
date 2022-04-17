resource "azurerm_network_security_group" "default" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_virtual_network" "default" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.addr_space
  dns_servers         = var.dns_servers

  subnet {
    name           = var.subnet1_name
    address_prefix = var.subnet1_address_prefix
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = var.subnet2_address_prefix
    security_group = azurerm_network_security_group.default.id
  }

}
