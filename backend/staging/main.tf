provider "azurerm" {
  features {}

  subscription_id = var.subscriptionId
  tenant_id       = var.tenantId
  skip_provider_registration = true
}

module "network" {
  source = "../../modules/network"

  tenantId         = var.tenantId
  subscriptionId   = var.subscriptionId
  location         = var.location
  route_table_name = var.route_table_name
  project_name     = var.project_name
  instances_number = var.instances_number
}

module "dns_zone" {
  source = "../../modules/private_dns_zone"
  #version = "1.0.0"

  location = var.location
  resource_group_name = var.resource_group_name
}


module "psql" {
  source = "../../modules/psql"
  #version = "1.0.0"

  location            = var.location
  azure_pg_name       = var.azure_pg_name
  azure_pgsubnet_name = var.azure_pgsubnet_name
  azure_pgvnet_name   = var.azure_pgvnet_name
  project_name        = var.project_name
  rg_name             = module.network.rg_name
  pg_hostname         = var.pg_hostname
  postgresql_server_admin_login = var.postgresql_server_admin_login
  postgresql_server_admin_password = var.postgresql_server_admin_password
  postgresql_databases_names = var.databases_names
  postgresql_databases_user = var.databases_user
  postgresql_databases_password = var.postgresql_databases_password
  postgresql_server_pgbouncer_enabled = var.pgbouncer_enabled
  postgresql_server_configurations = var.postgresql_server_configurations
}

resource "azurerm_linux_virtual_machine" "example" {

  count = var.instances_number

  name                = "${var.project_name}-${count.index}"
  resource_group_name = module.network.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    element(module.network.net_int_id, count.index),
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
    
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt install -y nginx && sudo service nginx start"]

    connection {
      type        = "ssh"
      host        = element(module.network.ip_address, count.index)
      user        = "adminuser"
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

# resource "azurerm_linux_virtual_machine" "imported_vm" {

#   count = var.instances_number

#   name                = "${var.project_name}-${count.index}"
#   resource_group_name = module.network.rg_name
#   location            = var.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     element(module.network.net_int_id, count.index),
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
    
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }

#   provisioner "remote-exec" {
#     inline = ["sudo apt install -y nginx && sudo service nginx start"]

#     connection {
#       type        = "ssh"
#       host        = element(module.network.ip_address, count.index)
#       user        = "adminuser"
#       private_key = file("~/.ssh/id_rsa")
#     }
#   }
# }

module  "storage_account" {
  source = "../../modules/storage_account"

  
 storage_account_name = var.storage_account_name
 resource_group_name = var.resource_group_name
 location = var.location
  
}

module "log_analytics_workspace" {
  source = "../../modules/log_analytics_workspace"

  location = var.location
  resource_group_name = var.resource_group_name
  log_analytics_name = var.log_analytics_name
}

# module "container_registry" {
#   source = "../../modules/container_registry"

#   location = var.location
#   resource_group_name = var.resource_group_name
#   container_registry_name = var.container_registry_name
#   container_registry_sku = var.container_registry_sku
#   container_registry_admin_enabled = var.container_registry_admin_enabled
#   container_registry_georeplication_locations = var.container_registry_georeplication_locations
# container_registry_privatelink_name = var.container_registry_privatelink_name
# container_registry_privatelink_subnet_id = var.container_registry_privatelink_subnet_id
#   container_registry_regional_endpoint_enabled = var.container_registry_regional_endpoint_enabled
#   container_registry_zone_redundancy_enabled = var.container_registry_zone_redundancy_enabled
#   public_network_access_enabled = var.public_network_access_enabled
#   container_registry_private_dns_zone_ids = var.container_registry_private_dns_zone_ids
#   tags = var.tags

# }
