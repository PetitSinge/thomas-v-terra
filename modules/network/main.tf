resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  count               = length(var.subnet_configs)
  name                = var.subnet_configs[count.index].name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = var.subnet_configs[count.index].address_prefixes

  tags = var.subnet_configs[count.index].tags
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the virtual network"
}

output "subnet_ids" {
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
  description = "List of subnet IDs"
}
