output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the virtual network"
}

output "subnet_ids" {
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
  description = "List of subnet IDs"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Name of the virtual network"
}

output "subnet_names" {
  value       = [for subnet in azurerm_subnet.subnet : subnet.name]
  description = "List of subnet names"
}
