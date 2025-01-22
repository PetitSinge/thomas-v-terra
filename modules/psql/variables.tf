variable "server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the PostgreSQL server will be created"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the PostgreSQL database"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU for the PostgreSQL server"
  type        = string
  default     = "Standard_B2ms"
}

variable "storage_mb" {
  description = "Storage size for the PostgreSQL server (in MB)"
  type        = number
  default     = 32768
}


variable "postgres_version" {
  description = "Version of PostgreSQL"
  type        = string
  default     = "13"
}

variable "delegated_subnet_id" {
  description = "ID of the delegated subnet for the PostgreSQL server"
  type        = string
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "ha_mode" {
  description = "High availability mode for the PostgreSQL server"
  type        = string
  default     = "ZoneRedundant" # Options: ZoneRedundant, Disabled
}

variable "tags" {
  description = "Tags to apply to the PostgreSQL server"
  type        = map(string)
  default     = {}
}
