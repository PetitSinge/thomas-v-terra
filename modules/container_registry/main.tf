resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  tags = var.tags
}

output "url" {
  value       = azurerm_container_registry.acr.login_server
  description = "URL of the container registry"
}
