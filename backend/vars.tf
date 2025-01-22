variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

# PostgreSQL variables
variable "db_admin_username" {
  description = "Admin username for the PostgreSQL database"
  type        = string
}

variable "db_admin_password" {
  description = "Admin password for the PostgreSQL database"
  type        = string
}

variable "db_sku_name" {
  description = "SKU for the PostgreSQL database"
  type        = string
}

variable "db_storage_mb" {
  description = "Storage size for the PostgreSQL database (in MB)"
  type        = number
}


variable "storage_account_sku" {
  description = "SKU for the storage account"
  type        = string
}

variable "prefix" {
  description = "Prefix for naming Azure resources"
  type        = string
}
variable "postgres_version" {
  description = "Version of PostgreSQL"
  type        = string
  default     = "13"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    environment = "staging"
    project     = "terraform"
  }
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
