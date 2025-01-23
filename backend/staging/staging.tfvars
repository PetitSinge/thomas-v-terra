tenantId             = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
subscriptionId       = "0696952d-ddcb-4855-a2de-0068909dbc91"
location             = "francecentral"
project_name         = "toto-staging"
resource_group_name  = "toto-staging"

## PostgreSQL
postgresql_server_admin_login    = "psqladmin"
postgresql_server_admin_password = "H@Sh1CoR3!"
databases_names                  = ["toto_db_1", "toto_db_2"]
databases_user                   = "toto_user"
pgbouncer_enabled                = true
postgresql_server_configurations = {
  shared_preload_libraries = {
    value = "pg_stat_statements,pgaudit"
  },
  max_connections = {
    value = "1000"
  }
}

## Network
route_table_name = "toto-staging-rt"
storage_account_name = "totostagingsa"

## Log Analytics
log_analytics_name = "toto-staging-log"