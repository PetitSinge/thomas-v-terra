resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password
  version             = var.postgres_version
  sku_name            = var.sku_name
  storage_mb          = var.storage_mb
  delegated_subnet_id = null

  # Active l'accès public
  public_network_access_enabled = true

  # Supprime l'association avec une zone DNS privée
  # private_dns_zone_id = var.private_dns_zone_id (supprimé)

  high_availability {
    mode = var.ha_mode
  }

  tags = var.tags
}
