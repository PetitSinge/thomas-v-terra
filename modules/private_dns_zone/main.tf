# ---------------------------------------------------------------------------------------------------------------------
# DATA REFERENCES
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_private_dns_zone" "private_dns_zone_azurecr" {

  name                = "privatelink.azurecr.io"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "private_dns_zone_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "private_dns_zone_vaultcore" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
}
