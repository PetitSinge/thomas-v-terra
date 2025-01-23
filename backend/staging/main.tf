provider "azurerm" {
  features {}

  subscription_id = var.subscriptionId
  tenant_id       = var.tenantId
  skip_provider_registration = true
}

# Module Network
module "network" {
  source = "../../modules/network"
  tenantId         = var.tenantId
  subscriptionId   = var.subscriptionId
  location         = var.location
  route_table_name = var.route_table_name
  project_name     = var.project_name
  resource_group_name = var.resource_group_name # Passer le nom correct du RG ici
  instances_number = var.instances_number
}

# Module DNS Zone
module "dns_zone" {
  source = "../../modules/private_dns_zone"
  location = var.location
  resource_group_name = var.resource_group_name # Passer le nom correct du RG ici
}

# Module PostgreSQL
module "psql" {
  source = "../../modules/psql"
  location            = var.location
  azure_pg_name       = var.azure_pg_name
  azure_pgsubnet_name = var.azure_pgsubnet_name
  azure_pgvnet_name   = var.azure_pgvnet_name
  project_name        = var.project_name
  rg_name             = var.resource_group_name # Passer le nom correct du RG ici
  pg_hostname         = var.pg_hostname
  postgresql_server_admin_login    = var.postgresql_server_admin_login
  postgresql_server_admin_password = var.postgresql_server_admin_password
  postgresql_databases_names       = var.databases_names
  postgresql_databases_user        = var.databases_user
  postgresql_databases_password    = var.postgresql_databases_password
  postgresql_server_pgbouncer_enabled = var.pgbouncer_enabled
  postgresql_server_configurations    = var.postgresql_server_configurations
}

# Resource Linux Virtual Machine
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

# Module Storage Account
module "storage_account" {
  source = "../../modules/storage_account"

  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name # Passer le nom correct du RG ici
  location             = var.location
}

# Module Log Analytics Workspace
module "log_analytics_workspace" {
  source = "../../modules/log_analytics_workspace"

  location = var.location
  resource_group_name = var.resource_group_name # Passer le nom correct du RG ici
  log_analytics_name = var.log_analytics_name
}

