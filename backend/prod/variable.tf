variable "subscriptionId" {
  type        = string
  description = "The subscription ID for Azure."
}

variable "project_name" {
  type        = string
  description = "The name of the project."
}

variable "tenantId" {
  type        = string
  description = "The tenant ID for Azure."
}

variable "location" {
  type        = string
  description = "The Azure region for resource deployment."
}

## ROUTE Table

variable "route_table_name" {
  type        = string
  default     = "route-table"
  description = "Name of the route table."
}

## VNET

variable "vnet_name" {
  type        = string
  default     = "default_vnet"
  description = "Name of the virtual network."
}

variable "vnet_address_space" {
  type        = list(string)
  default     = null
  description = "Address space of the virtual network."
}

variable "subnet_name" {
  type        = string
  default     = "default_subnet"
  description = "Name of the subnet."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  default     = null
  description = "Address prefixes of the subnet."
}

## PGSQL

variable "azure_pgvnet_name" {
  type        = string
  default     = "pgvnet"
  description = "Name of the PostgreSQL VNET."
}

variable "azure_pgsubnet_name" {
  type        = string
  default     = "pgsubnet"
  description = "Name of the PostgreSQL subnet."
}

variable "azure_pg_name" {
  type        = string
  default     = "pg"
  description = "Name of the PostgreSQL server."
}

variable "pg_hostname" {
  type        = string
  default     = "postgres.database.azure.com"
  description = "Hostname for PostgreSQL server."
}

variable "instances_number" {
  type        = number
  default     = 1
  description = "The number of instances to deploy."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group."
}



variable "postgresql_server_admin_login" {
  type        = string
  description = "The administrator username of the PostgreSQL server."
}

variable "postgresql_server_admin_password" {
  type        = string
  description = "The administrator password of the PostgreSQL server."
}


variable "storage_account_name" {
  type = string
  default = ""
  description = "storage account name"
}

variable "databases_names" {
  type        = list(string)
  description = "List of databases names to create."
  default     = null
}

variable "databases_user" {
  type        = string
  description = "The user for the PostgreSQL databases."
}

variable "pgbouncer_enabled" {
  type        = bool
  default     = false
  description = "Enable pgbouncer for PostgreSQL."
}

variable "postgresql_server_configurations" {
  type = map(object({
    value = string
  }))
  default     = null
  description = "Custom PostgreSQL server configurations."
}

variable "log_analytics_name" {
  type        = string
  description = "Name of the log analytics workspace."
  default = ""
  
}