resource "azurerm_log_analytics_workspace" "log_ws" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

