tenantId             = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
subscriptionId       = "0696952d-ddcb-4855-a2de-0068909dbc91"
location             = "francecentral"
project_name         = "aa06mdo-back"
resource_group_name  = "m2dototo"

## Route table

route_table_name = "m2dospv-rt"

## VNET

vnet_name = "example-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnet_name = "example-subnet"
storage_account_name = "m2dototo"

## Postgresql

postgresql_server_admin_login    = "psqladmin"
postgresql_server_admin_password = "H@Sh1CoR3!"

pgbouncer_enabled = true
databases_names    = ["aa06_m2dospv", "aa06_m1dospv"]
databases_user     = "m2dospv"
#databases_password = "acdybc9bzJxWert8C"
#server_zone        = "1"
postgresql_server_configurations = {
  "azure.extensions" = {
    value = "PGAUDIT,PLV8,PG_STAT_STATEMENTS"
  },
  shared_preload_libraries = {
    value = "pg_cron,pg_stat_statements,pgaudit"
  },
  log_line_prefix = {
    value = "%m back=%b [%p] start=%s  %q user=%u@%r %a db=%d tag=%i "
  },
  max_connections = {
    value = "1000"
  },
  max_wal_size = {
    value = "1024"
  },
  "pg_qs.query_capture_mode" = {
    value = "ALL"
  },
  "pgbouncer.default_pool_size" = {
    value = "500"
  },
  "pgbouncer.ignore_startup_parameters" = {
    value = "extra_float_digits"
  },
  "pgbouncer.max_client_conn" = {
    value = "1000"
  },
  "pgbouncer.stats_users" = {
    value = "adminuser"
  },
  "pgms_wait_sampling.query_capture_mode" = {
    value = "ALL"
  },
  track_io_timing = {
    value = "ON"
  },
  log_lock_waits = {
    value = "ON"
  },
  log_statement = {
    value = "all"
  },
  log_min_duration_statement = {
    value = "1000"
  },
  log_statement_stats = {
    value = "ON"
  },
  max_parallel_maintenance_workers = {
    value = "64"
  },
  "metrics.autovacuum_diagnostics" = {
    value = "on"
  },
  "metrics.collector_database_activity" = {
    value = "ON"
  },
  "metrics.pgbouncer_diagnostics" = {
    value = "ON"
  },
  "pg_stat_statements.track" = {
    value = "TOP"
  },
  "pgaudit.log" = {
    value = "DDL,READ,ROLE,WRITE"
  },
  "pgaudit.log_relation" = {
    value = "ON"
  },
  "pgaudit.log_statement_once" = {
    value = "ON"
  },
  "pgaudit.role" = {
    value = "adminuser"
  }
}
  
### Log analytics workspace

log_analytics_name = "m2dos-log"



# ## Container registry
# container_registry_privatelink_name = "m2dosnetpve001"

# container_registry_name                     = "m2dospvsvcctnr01"
# container_registry_sku                      = "Premium"
# container_registry_admin_enabled            = "true"
# container_registry_georeplication_locations = "West Europe"
# container_registry_zone_redundancy_enabled   = false
# container_registry_regional_endpoint_enabled = true
# container_registry_network_rule_set = [{
#   default_action = "Deny"
#   ip_rule         = [{
#     action   = "Allow"
#     ip_range = "4.1.10.20/32"
#   }]
# }]
