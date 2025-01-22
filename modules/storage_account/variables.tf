variable "account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be created"
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication strategy for the storage account"
  type        = string
  default     = "LRS" # Options: LRS, GRS, RAGRS, ZRS
}

variable "allow_blob_public_access" {
  description = "Allow public access to blobs"
  type        = bool
  default     = false
}

variable "enable_https_traffic_only" {
  description = "Force HTTPS traffic only"
  type        = bool
  default     = true
}

variable "container_names" {
  description = "List of container names to create in the storage account"
  type        = list(string)
}

variable "account_name" {
  description = "Base name for the storage account"
  type        = string
}


variable "container_access_type" {
  description = "Access type for the containers (private, blob, or container)"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}
