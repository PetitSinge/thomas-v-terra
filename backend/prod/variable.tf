variable "subscriptionId" {
  type = string
}

variable "project_name" {
  type = string
}

variable "tenantId" {
  type = string
}

variable "location" {
  type = string
}

## ROUTE Table

variable "route_table_name" {
  type        = string
  default     = "route-table"
  description = "value of the route table name"
}

## VNET

variable "vnet_name" {
  type    = string
  default = "default_vnet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = null
}

variable "subnet_name" {
  type    = string
  default = "default_subnet"
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = null
}

## PGSQL - Serveur 1
variable "pg_hostname_1" {
  type        = string
  description = "Hostname for the first PostgreSQL server."
  default     = "prod-pg-server-1.database.azure.com"
}

variable "databases_names_1" {
  type        = list(string)
  description = "List of databases to create on the first PostgreSQL server."
  default     = ["prod_database_1"]
}

## PGSQL - Serveur 2
variable "pg_hostname_2" {
  type        = string
  description = "Hostname for the second PostgreSQL server."
  default     = "prod-pg-server-2.database.azure.com"
}

variable "databases_names_2" {
  type        = list(string)
  description = "List of databases to create on the second PostgreSQL server."
  default     = ["prod_database_2"]
}

## Variables partagées PGSQL
variable "azure_pgvnet_name" {
  type    = string
  default = "pgvnet"
}

variable "azure_pgsubnet_name" {
  type    = string
  default = "pgsubn"
}

variable "postgresql_server_admin_login" {
  type        = string
  description = "The administrator username of the PostgreSQL server."
}

variable "postgresql_server_admin_password" {
  type        = string
  description = "The administrator password of the PostgreSQL server."
}

variable "databases_user" {
  type    = string
  default = null
}

variable "postgresql_databases_password" {
  type    = string
  default = null
}

variable "pgbouncer_enabled" {
  type        = bool
  description = "Enable pgbouncer."
  default     = false
}

variable "postgresql_server_configurations" {
  type = map(object({
    value = string
  }))
  default = null
}

## Storage Account

variable "storage_account_name" {
  type        = string
  default     = ""
  description = "storage account name"
}

## Log Analytics Workspace

variable "log_analytics_name" {
  type        = string
  default     = ""
  description = "log analytics name"
}