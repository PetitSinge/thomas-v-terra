resource "azurerm_virtual_network" "pg" {
  name                = "${var.resource_group_name}-${var.azure_pgvnet_name}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "pg" {
  name                 = "${var.resource_group_name}-${var.azure_pgsubnet_name}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.pg.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_private_dns_zone" "pg" {
  name                = "${var.resource_group_name}.${var.pg_hostname}"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pg" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.pg.name
  virtual_network_id    = azurerm_virtual_network.pg.id
  resource_group_name   = var.rg_name
}

resource "azurerm_postgresql_flexible_server" "pg" {
  name                   = "${var.resource_group_name}-${var.azure_pg_name}"
  resource_group_name    = var.rg_name
  location               = var.location
  version                = "15"
  delegated_subnet_id    = azurerm_subnet.pg.id
  private_dns_zone_id    = azurerm_private_dns_zone.pg.id
  administrator_login    = var.postgresql_server_admin_login    
  administrator_password =  var.postgresql_server_admin_password 
  zone                   = "2"

  storage_mb = 32768

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.pg]

}


resource "azurerm_postgresql_flexible_server_database" "postgresql_dbs" {
  for_each  = toset(var.postgresql_databases_names)
  name      = each.value
  server_id = azurerm_postgresql_flexible_server.pg.id
  charset   = "UTF8"
  collation = "en_US.utf8"

  depends_on = [azurerm_postgresql_flexible_server.pg]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgresql_pgbouncer" {
  name      = "pgbouncer.enabled"
  server_id = azurerm_postgresql_flexible_server.pg.id
  value     = var.postgresql_server_pgbouncer_enabled
}

resource "azurerm_postgresql_flexible_server_configuration" "postgresql_configurations" {
  for_each  = var.postgresql_server_configurations
 
  name      = each.key
  server_id = azurerm_postgresql_flexible_server.pg.id
  value     = each.value["value"]
}
