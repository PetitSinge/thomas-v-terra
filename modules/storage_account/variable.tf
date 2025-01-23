variable "storage_account_name" {
  type = string
  default = ""
  description = "storage account name"
  
}
variable "resource_group_name" {
  type = string
  default = ""
  description = "resource group name"
  
}

variable "location" {
  type = string
  default = ""
  description = "location"
  
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
  description = "storage account tier"
  
}

variable "common_tags" {
  type = map(string)
  default = {
    environment = "dev"
    project     = "m2dospv"
  }
  
}
variable "storage_account_kind" {
  type = string
  default = "StorageV2"
  description = "storage account kind"
  
}

variable "storage_account_replication_type" {
  type = string
  default = "RAGRS"
  description = "storage account replication type"
  
}