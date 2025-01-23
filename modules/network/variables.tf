variable "subscriptionId" {
  type = string
}

variable "tenantId" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = "m2dospv-rg"

}

variable "location" {
  type = string
  default = "francecentral"
}

variable "route_table_name" {
  type = string
  default = ""
  description = "value of the route table name"  
}


variable "project_name" {
  type = string
}


variable "instances_number" {
  type = number
  default = 1
}

variable "vnet_name" {
  type = string
  default = "example-vnet"
  description = "value of the vnet name"
  
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
  
}

variable "subnet_name" {
  type = string
  default = "example-subnet"
  description = "value of the subnet name"
  
}

variable "subnet_address_prefixes" {
  type = list(string)
  default = ["10.0.1.0/24"]
  description = "value of the subnet address prefix"
}