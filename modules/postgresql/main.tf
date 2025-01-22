resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = "${var.prefix}-postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.pg_version

  delegated_subnet_id = var.delegated_subnet_id

  high_availability {
    mode = "ZoneRedundant"
  }
}

output "postgresql_host" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

