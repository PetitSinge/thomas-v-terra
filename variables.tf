variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "region" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_model" {
  description = "Size of the virtual machine"
  type        = string
}

variable "username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "vm_publisher" {
  description = "Publisher of the VM image"
  type        = string
}

variable "vm_offer" {
  description = "Offer of the VM image"
  type        = string
}

variable "vm_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "vm_version" {
  description = "Version of the VM image"
  type        = string
}

variable "pg_admin_username" {
  description = "Admin username for PostgreSQL"
  type        = string
  default     = "pgadmin"
}

variable "pg_admin_password" {
  description = "Admin password for PostgreSQL"
  type        = string
}

variable "pg_version" {
  description = "Version of PostgreSQL"
  type        = string
  default     = "13"
}

variable "pg_sku_name" {
  description = "SKU name for PostgreSQL instance"
  type        = string
  default     = "GP_Gen5_2"
}

variable "pg_storage_mb" {
  description = "Storage size for PostgreSQL instance (in MB)"
  type        = number
  default     = 51200
}

