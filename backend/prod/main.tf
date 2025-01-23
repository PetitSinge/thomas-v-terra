provider "azurerm" {
  features {}

  subscription_id            = var.subscriptionId
  tenant_id                  = var.tenantId
  skip_provider_registration = true
}

# Création du premier serveur PostgreSQL
module "psql_server_1" {
  source                           = "../../modules/psql"
  location                         = var.location
  azure_pg_name                    = "${var.project_name}-pg1"
  azure_pgsubnet_name              = var.azure_pgsubnet_name
  azure_pgvnet_name                = var.azure_pgvnet_name
  project_name                     = var.project_name
  rg_name                          = var.resource_group_name
  pg_hostname                      = var.pg_hostname_1
  postgresql_server_admin_login    = var.postgresql_server_admin_login
  postgresql_server_admin_password = var.postgresql_server_admin_password
  postgresql_databases_names       = var.databases_names_1
  postgresql_databases_user        = var.databases_user
  postgresql_databases_password    = var.databases_password
  postgresql_server_pgbouncer_enabled = var.pgbouncer_enabled
  postgresql_server_configurations = var.postgresql_server_configurations
}

# Création du second serveur PostgreSQL
module "psql_server_2" {
  source                           = "../../modules/psql"
  location                         = var.location
  azure_pg_name                    = "${var.project_name}-pg2"
  azure_pgsubnet_name              = var.azure_pgsubnet_name
  azure_pgvnet_name                = var.azure_pgvnet_name
  project_name                     = var.project_name
  rg_name                          = var.resource_group_name
  pg_hostname                      = var.pg_hostname_2
  postgresql_server_admin_login    = var.postgresql_server_admin_login
  postgresql_server_admin_password = var.postgresql_server_admin_password
  postgresql_databases_names       = var.databases_names_2
  postgresql_databases_user        = var.databases_user
  postgresql_databases_password    = var.databases_password
  postgresql_server_pgbouncer_enabled = var.pgbouncer_enabled
  postgresql_server_configurations = var.postgresql_server_configurations
}