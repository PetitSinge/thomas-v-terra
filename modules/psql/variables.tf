variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "db_admin_username" {
  description = "Admin username for the PostgreSQL database"
  type        = string
}

variable "db_admin_password" {
  description = "Admin password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_sku_name" {
  description = "SKU for the PostgreSQL server"
  type        = string
  default     = "Standard_B2ms"
}

variable "db_storage_mb" {
  description = "Storage size for the PostgreSQL server (in MB)"
  type        = number
  default     = 32768
}

variable "postgres_version" {
  description = "Version of PostgreSQL"
  type        = string
  default     = "13"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
