output "rg_name" {
	value = azurerm_resource_group.example.name 
}

output "net_int_id" {
	value = azurerm_network_interface.example.*.id
}

output "ip_address" {
	value = azurerm_public_ip.example.*.ip_address
}
