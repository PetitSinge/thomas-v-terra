tenantId             = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
subscriptionId       = "0696952d-ddcb-4855-a2de-0068909dbc91"
location             = "francecentral"
project_name         = "aa06mdo-back"
resource_group_name  = "toto-prod"

## Log Analytics Workspace
log_analytics_name = "toto-prod-log"

## Storage Account
storage_account_name = "totoprodstorage"

## Postgresql
postgresql_server_admin_login    = "psqladmin"
postgresql_server_admin_password = "Pr0dS3cur3P@ss!" # Remplace par un mot de passe sécurisé
pgbouncer_enabled = true
databases_names    = ["prod_database_1", "prod_database_2"]
databases_user     = "prod_user"
postgresql_server_configurations = {
  shared_preload_libraries = {
    value = "pg_stat_statements,pgaudit"
  },
  max_connections = {
    value = "2000"
  },
  max_wal_size = {
    value = "2048"
  },
  track_io_timing = {
    value = "ON"
  },
  log_statement = {
    value = "ddl"
  },
  log_min_duration_statement = {
    value = "500"
  },
  log_statement_stats = {
    value = "ON"
  },
  "pg_stat_statements.track" = {
    value = "ALL"
  },
  "pgaudit.log" = {
    value = "DDL,READ,ROLE,WRITE"
  },
  "pgaudit.log_relation" = {
    value = "ON"
  }
}