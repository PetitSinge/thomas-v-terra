resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = "${var.prefix}-postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.version

  delegated_subnet_id = var.delegated_subnet_id

  backup {
    retention_days = 7
  }

  high_availability {
    mode = "ZoneRedundant"
  }

  storage {
    auto_grow_enabled = true
  }
}

output "postgresql_host" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

