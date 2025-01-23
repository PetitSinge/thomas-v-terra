variable "resource_group_name" {
  type = string
  default = "m2dospv-rg"
}

variable "azure_pg_name" {
  type = string
}

variable "azure_pgsubnet_name" {
  type = string
}

variable "azure_pgvnet_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "pg_hostname" {
  type = string
  description = "value of the pg hostname"
}

variable "location" {
  type = string
}




#####
variable "postgresql_server_admin_login" {
  type        = string
  description = "The administrator username of the PostgreSQL server."
}

variable "postgresql_server_admin_password" {
  type        = string
  description = "The administrator password of the PostgreSQL server."
}

variable "postgresql_databases_names" {
  type        = list(string)
  description = "List of databases names to create."
  default     = null
}

variable "postgresql_databases_user" {
  type    = string
  default = null
}

variable "postgresql_databases_password" {
  type    = string
  default = null
}
variable "postgresql_server_use_vnet_integration" {
  type        = bool
  description = "PostgreSQL will use a VNET Integration instead of firewall rules."
  default     = false
}

variable "postgresql_server_firewall_rule" {
  type = map(
    object({
      start_ip_address = string
      end_ip_address   = string
    })
  )
  description = "List of Firewall Rule to apply"
  default = {
    Public_IP = {
      start_ip_address = "4.178.181.9"
      end_ip_address   = "4.178.181.9"
    }
  }
}

variable "postgresql_server_pgbouncer_enabled" {
  type        = bool
  description = "Enable integrated PgBouncer for PostgreSQL flexible server true/false."
}

variable "postgresql_server_configurations" {
  type = map(
    object({
      value = string
    })
  )
  description = "List of configurations to set."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}