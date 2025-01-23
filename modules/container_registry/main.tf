resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku                      = var.container_registry_sku
  admin_enabled            = var.container_registry_admin_enabled

  georeplications {
    location                  = var.container_registry_georeplication_locations
    regional_endpoint_enabled = var.container_registry_regional_endpoint_enabled
    zone_redundancy_enabled   = var.container_registry_zone_redundancy_enabled
    tags                      = var.tags
  }

  public_network_access_enabled = var.public_network_access_enabled

  dynamic "network_rule_set" {
    for_each = [for na in var.container_registry_network_rule_set : {
      default_action = na.default_action
      ip_rule        = na.ip_rule
    }]
    content {
      default_action = network_rule_set.value.default_action
      ip_rule        =network_rule_set.value.ip_rule
    }
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "azurerm_container_registry_privatelink" {
  name                = var.container_registry_privatelink_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.container_registry_privatelink_subnet_id

  private_service_connection {
    name                              = azurerm_container_registry.acr.name
    private_connection_resource_id    = azurerm_container_registry.acr.id
    subresource_names                 = [ "registry" ]
    is_manual_connection              = false
  }

  private_dns_zone_group {
    name = "privatelink.azurecr.io"
    private_dns_zone_ids = [var.container_registry_private_dns_zone_ids]
  }

  tags = var.tags
}