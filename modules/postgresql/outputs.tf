output "postgresql_fqdn" {
  value = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_admin_username" {
  value = var.admin_username
}

