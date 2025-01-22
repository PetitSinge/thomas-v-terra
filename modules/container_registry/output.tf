output "url" {
  value       = azurerm_container_registry.acr.login_server
  description = "URL of the container registry"
}

output "id" {
  value       = azurerm_container_registry.acr.id
  description = "ID of the container registry"
}

output "admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "Admin username for the container registry"
  sensitive   = true
}

output "admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "Admin password for the container registry"
  sensitive   = true
}
