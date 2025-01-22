resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version = var.postgres_version

  delegated_subnet_id = var.delegated_subnet_id

  backup {
    retention_days = var.backup_retention_days
  }

  high_availability {
    mode = var.ha_mode
  }

  tags = var.tags
}
