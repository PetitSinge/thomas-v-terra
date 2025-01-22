resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = "${var.prefix}-postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  sku_name   = "GP_Standard_D2s_v3"
  storage_mb = 32768
  version    = "13"

  delegated_subnet_id = azurerm_subnet.subnet_vm.id

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

