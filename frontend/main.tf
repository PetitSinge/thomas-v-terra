provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Appel au module "container_registry"
module "container_registry" {
  source              = "../modules/container_registry"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  registry_name       = var.registry_name
  sku                 = var.registry_sku
  admin_enabled       = true
  tags = {
    environment = "staging"
    team        = "frontend"
  }
}

# Appel au module "network"
module "network" {
  source              = "../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
}

# Appel au module "private_dns_zone"
module "private_dns_zone" {
  source              = "../modules/private_dns_zone"
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = "myapp.local"
  vnet_ids            = module.network.subnet_ids
  registration_enabled = true
  a_records = [
    {
      name   = "web"
      ttl    = 3600
      values = ["10.0.0.4", "10.0.0.5"]
    },
    {
      name   = "db"
      ttl    = 3600
      values = ["10.0.1.4"]
    }
  ]
  tags = {
    environment = "frontend"
    team        = "networking"
  }
}


output "container_registry_url" {
  description = "URL of the container registry"
  value       = module.container_registry.url
}

output "dns_zone_name" {
  description = "DNS zone name"
  value       = module.private_dns_zone.zone_name
}

output "network_vnet_id" {
  description = "ID of the virtual network"
  value       = module.network.vnet_id
}
