variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "prefix" {
  description = "Resource prefix"
  type        = string
}

variable "admin_username" {
  description = "PostgreSQL admin username"
  type        = string
}

variable "admin_password" {
  description = "PostgreSQL admin password"
  type        = string
}

variable "sku_name" {
  description = "SKU name for PostgreSQL instance"
  type        = string
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
}


variable "delegated_subnet_id" {
  description = "Delegated subnet ID"
  type        = string
  default     = null
}

