tenantId             = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
subscriptionId       = "0696952d-ddcb-4855-a2de-0068909dbc91"
location             = "francecentral"
project_name         = "aa06mdo-back"
resource_group_name  = "toto-prod"

# Postgres serveur 1
pg_hostname_1        = "prod-pg-server-1"
databases_names_1    = ["prod_database_1"]

# Postgres serveur 2
pg_hostname_2        = "prod-pg-server-2"
databases_names_2    = ["prod_database_2"]

# Variables communes
postgresql_server_admin_login      = "psqladmin"
postgresql_server_admin_password   = "Pr0dS3cur3P@ss!"
databases_user                     = "prod_user"
pgbouncer_enabled                  = true
postgresql_server_configurations = {
  shared_preload_libraries = {
    value = "pg_stat_statements,pgaudit"
  },
  max_connections = {
    value = "2000"
  }
}