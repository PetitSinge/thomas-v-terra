output "public_ip" {
  description = "Public IP of the Linux virtual machine"
  value       = azurerm_public_ip.public_ip_vm.ip_address
}

output "private_key_path" {
  description = "Path to the private SSH key"
  value       = var.ssh_private_key_path
}

output "postgresql_fqdn" {
  description = "Fully Qualified Domain Name of the PostgreSQL server"
  value       = module.postgresql.postgresql_fqdn
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg_vm.name
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet_vm.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.subnet_vm.name
}

