variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the network will be created"
  type        = string
}

variable "location" {
  description = "Azure location for the network resources"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_configs" {
  description = "Configuration for the subnets"
  type = list(object({
    name            = string
    address_prefixes = list(string)
    tags            = map(string)
  }))
}

variable "tags" {
  description = "Tags to apply to the network resources"
  type        = map(string)
}
