variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the frontend resources"
  type        = string
}

variable "registry_name" {
  description = "Name of the container registry"
  type        = string
}

variable "registry_sku" {
  description = "SKU for the container registry"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "dns_zone_name" {
  description = "Name of the DNS zone"
  type        = string
}

variable "dns_records" {
  description = "DNS records to create in the private DNS zone"
  type        = map(object({
    name  = string
    type  = string
    ttl   = number
    value = list(string)
  }))
}
