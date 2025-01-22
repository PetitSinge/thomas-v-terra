output "fqdn" {
  value       = azurerm_postgresql_flexible_server.postgresql.fqdn
  description = "Fully Qualified Domain Name of the PostgreSQL server"
}

output "id" {
  value       = azurerm_postgresql_flexible_server.postgresql.id
  description = "ID of the PostgreSQL server"
}

output "admin_username" {
  value       = azurerm_postgresql_flexible_server.postgresql.administrator_login
  description = "Admin username for the PostgreSQL server"
}
