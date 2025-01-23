# Identifiants Azure
tenantId             = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
subscriptionId       = "0696952d-ddcb-4855-a2de-0068909dbc91"

# Localisation et projet
location             = "francecentral"
project_name         = "toto-project-back"
resource_group_name  = "toto-prod"

# PostgreSQL - Serveur 1
pg_hostname_1        = "prod-pg-server-1.database.azure.com"
databases_names_1    = ["prod_database_1"]

# PostgreSQL - Serveur 2
pg_hostname_2        = "prod-pg-server-2.database.azure.com"
databases_names_2    = ["prod_database_2"]

# Variables communes PostgreSQL
postgresql_server_admin_login      = "psqladmin"
postgresql_server_admin_password   = "Pr0dS3cur3P@ss!"
databases_user                     = "prod_user"
databases_password                 = "ProdDbPassword123!" 
pgbouncer_enabled                  = true

# Configurations spécifiques au serveur PostgreSQL
postgresql_server_configurations = {
  shared_preload_libraries = {
    value = "pg_stat_statements,pgaudit"
  },
  max_connections = {
    value = "2000"
  }
}