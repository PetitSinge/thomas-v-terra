provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Appel au module "network"
module "network" {
  source              = "../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_configs = [
    {
      name            = "${var.prefix}-subnet-1"
      address_prefixes = ["10.0.1.0/24"]
      tags            = {
        environment = "staging"
      }
    },
    {
      name            = "${var.prefix}-subnet-2"
      address_prefixes = ["10.0.2.0/24"]
      tags            = {
        environment = "staging"
      }
    }
  ]
  tags = {
    environment = "staging"
    project     = "terraform-network"
  }
}



# Appel au module "psql"
module "psql" {
  source              = "../modules/psql"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = "${var.prefix}-postgresql"
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
  sku_name            = "Standard_B2ms"
  storage_mb          = 32768
  delegated_subnet_id = module.network.subnet_ids[0]
  backup_retention_days = 7
  ha_mode             = "ZoneRedundant"
  tags = {
    environment = "backend"
    team        = "database"
  }
}



# Appel au module "storage_account"
module "storage_account" {
  source              = "../modules/storage_account"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  account_name        = "${var.prefix}storage"
  account_tier        = "Standard"
  replication_type    = "LRS"
  allow_blob_public_access = false
  enable_https_traffic_only = true
  container_names = ["app-data", "logs", "backups"]
  container_access_type = "private"
  tags = {
    environment = "backend"
    team        = "storage"
  }
}

output "network_vnet_id" {
  description = "ID of the virtual network"
  value       = module.network.vnet_id
}

output "psql_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.psql.fqdn
}

output "storage_account_name" {
  description = "Storage account name"
  value       = module.storage_account.name
}

