output "id" {
  value = azurerm_container_registry.acr.id
}

output "admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "admin_password" {
  value = azurerm_container_registry.acr.admin_password
}

output "fqdn" {
  value = azurerm_container_registry.acr.login_server
}