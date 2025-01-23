variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "francecentral"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "container_registry_name" {
  type        = string
  description = "Container Registry name"
}

variable "container_registry_georeplication_locations" {
  type    = string
  description = "A location where the container registry should be geo-replicated."
  default = "North Europe"
}

variable "container_registry_zone_redundancy_enabled" {
  type = bool
  description = "Whether zone redundancy is enabled for this replication location?"
  default = false
}

variable "container_registry_regional_endpoint_enabled" {
  type = bool
  description = "Whether regional endpoint is enabled for this Container Registry?"
  default = false
}

variable "public_network_access_enabled" {
  type = bool
  description = "Whether public network access is allowed for the container registry"
  default = true
}

variable "container_registry_sku" {
  type    = string
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium."
  default = "Premium"
}

variable "container_registry_admin_enabled" {
  type    = bool
  description = "Specifies whether the admin user is enabled. "
  default = true
}

variable "container_registry_privatelink_name" {
  type  = string
  description = "(Required) Name of the Private Link"
}

variable "container_registry_privatelink_subnet_id" {
  type  = string
  description = "(Required) Alternative range of IP address for Private Link"
}

variable "container_registry_network_rule_set" {
  type = list(object(
    { default_action : string, 
    ip_rule : list(object({
         action : string, 
         ip_range : string
         }))
        }))
  description = "A list of rule set."
  default = [{
    default_action = "Deny"
    ip_rule         = [
      {
        action   = "Allow"
        ip_range = "6.8.15.1/32"
      }]
  }]
}

variable "container_registry_private_dns_zone_ids" {
  type  = string
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}