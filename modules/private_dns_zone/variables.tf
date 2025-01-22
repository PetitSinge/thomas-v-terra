variable "zone_name" {
  description = "Name of the private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_ids" {
  description = "List of Virtual Network IDs to link to the private DNS zone"
  type        = list(string)
}

variable "registration_enabled" {
  description = "Whether auto-registration of virtual machines in the linked virtual network is enabled"
  type        = bool
  default     = false
}

variable "a_records" {
  description = "List of A records to create in the DNS zone"
  type = list(object({
    name   = string
    ttl    = number
    values = list(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the private DNS zone"
  type        = map(string)
  default     = {}
}
