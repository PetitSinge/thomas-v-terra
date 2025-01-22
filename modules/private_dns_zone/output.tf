output "zone_name" {
  value       = azurerm_private_dns_zone.dns_zone.name
  description = "Name of the private DNS zone"
}

output "zone_id" {
  value       = azurerm_private_dns_zone.dns_zone.id
  description = "ID of the private DNS zone"
}

output "linked_vnets" {
  value       = [for link in azurerm_private_dns_zone_virtual_network_link.vnet_links : link.virtual_network_id]
  description = "List of Virtual Network IDs linked to the DNS zone"
}

output "a_records" {
  value       = [for record in azurerm_private_dns_a_record.a_records : { name = record.name, values = record.records }]
  description = "List of A records created in the private DNS zone"
}
