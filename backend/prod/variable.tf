variable "subscriptionId" {
  type        = string
  description = "The subscription ID for Azure."
}

variable "tenantId" {
  type        = string
  description = "The tenant ID for Azure."
}

variable "location" {
  type        = string
  description = "The Azure region for resource deployment."
}

variable "project_name" {
  type        = string
  description = "The name of the project."
}

## PGSQL - Serveur 1
variable "pg_hostname_1" {
  type        = string
  description = "Hostname for the first PostgreSQL server."
}

variable "databases_names_1" {
  type        = list(string)
  description = "List of databases to create on the first PostgreSQL server."
}

## PGSQL - Serveur 2
variable "pg_hostname_2" {
  type        = string
  description = "Hostname for the second PostgreSQL server."
}

variable "databases_names_2" {
  type        = list(string)
  description = "List of databases to create on the second PostgreSQL server."
}

## Variables partagées PGSQL
variable "azure_pgvnet_name" {
  type        = string
  description = "Name of the PostgreSQL VNET."
}

variable "azure_pgsubnet_name" {
  type        = string
  description = "Name of the PostgreSQL subnet."
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

variable "databases_user" {
  type        = string
  description = "The user for the PostgreSQL databases."
}

variable "databases_password" {
  type        = string
  description = "Password for the PostgreSQL databases."
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