resource "azurerm_private_dns_zone" "postgresql_dns_zone" {
  name                = "postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "vnet_links" {
  count                = length(var.vnet_ids)
  name                 = "${var.zone_name}-link-${count.index}"
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_ids[count.index]
  registration_enabled  = var.registration_enabled
}

resource "azurerm_private_dns_a_record" "a_records" {
  count                = length(var.a_records)
  name                 = var.a_records[count.index].name
  resource_group_name  = var.resource_group_name
  zone_name            = azurerm_private_dns_zone.dns_zone.name
  ttl                  = var.a_records[count.index].ttl
  records              = var.a_records[count.index].values
}

output "zone_name" {
  value       = azurerm_private_dns_zone.dns_zone.name
  description = "Name of the private DNS zone"
}

output "zone_id" {
  value       = azurerm_private_dns_zone.dns_zone.id
  description = "ID of the private DNS zone"
}

output "a_records" {
  value       = [for record in azurerm_private_dns_a_record.a_records : { name = record.name, values = record.records }]
  description = "List of A records created in the private DNS zone"
}
