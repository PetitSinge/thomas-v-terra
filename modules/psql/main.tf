resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password
  version             = var.postgres_version
  sku_name            = var.sku_name
  storage_mb          = var.storage_mb
  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  public_network_access_enabled = false

  high_availability {
    mode = var.ha_mode
  }

  tags = var.tags
}




resource "azurerm_private_dns_zone" "postgresql_dns" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  name                  = "${var.server_name}-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgresql_dns.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_id
}
