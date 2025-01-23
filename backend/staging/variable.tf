variable "subscriptionId" {
  type = string
}

variable "project_name" {
  type = string
}

variable "tenantId" {
  type = string
}

variable "location" {
  type = string
}


## ROUTE Table

variable "route_table_name" {
  type = string
  default = "route-table"
  description = "value of the route table name"
}

## VNET

variable "vnet_name" {
  type = string
  default = "default_vnet"
}

variable "vnet_address_space" {
  type = list(string)
  default = null
}

variable "subnet_name" {
  type = string
  default = "default_subnet"
  
}

variable "subnet_address_prefixes" {
  type = list(string)
  default = null
  
}




## PGSQL

variable "azure_pgvnet_name" {
  type    = string
  default = "pgvnet"
}

variable "azure_pgsubnet_name" {
  type    = string
  default = "pgsubn"
}
variable "azure_pg_name" {
  type    = string
  default = "pg"
}

variable "pg_hostname" {
  type    = string
  default = "postgres.database.azure.com"
}

variable "instances_number" {
  type    = number
  default = 1
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "storage_account_name" {
  type = string
  default = ""
  description = "storage account name"
}


variable "postgresql_server_admin_login" {
  type        = string
  description = "The administrator username of the PostgreSQL server."
}

variable "postgresql_server_admin_password" {
  type        = string
  description = "The administrator password of the PostgreSQL server."
}


variable "databases_names" {
  type        = list(string)
  description = "List of databases names to create."
  default     = null
}

variable "databases_user" {
  type    = string
  default = null
}

variable "postgresql_databases_password" {
  type    = string
  default = null
}

variable "pgbouncer_enabled" {
  type        = bool
  description = "Enable pgbouncer."
  default     = false
  
}


variable "postgresql_server_configurations" {
  type = map(object({
    value = string
  }))
  default = null
  
}

variable "log_analytics_name" {
  type = string
  default = ""
  description = "log analytics name"
  
}


# ## container registry

# variable "container_registry_name" {
#   type        = string
#   description = "Container Registry name"
# }

# variable "container_registry_georeplication_locations" {
#   type    = string
#   description = "A location where the container registry should be geo-replicated."
#   default = "North Europe"
# }

# variable "container_registry_zone_redundancy_enabled" {
#   type = bool
#   description = "Whether zone redundancy is enabled for this replication location?"
#   default = false
# }

# variable "container_registry_regional_endpoint_enabled" {
#   type = bool
#   description = "Whether regional endpoint is enabled for this Container Registry?"
#   default = false
# }

# variable "public_network_access_enabled" {
#   type = bool
#   description = "Whether public network access is allowed for the container registry"
#   default = true
# }

# variable "container_registry_sku" {
#   type    = string
#   description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium."
#   default = "Premium"
# }

# variable "container_registry_admin_enabled" {
#   type    = bool
#   description = "Specifies whether the admin user is enabled. "
#   default = true
# }

# variable "container_registry_privatelink_name" {
#   type  = string
#   description = "(Required) Name of the Private Link"
# }

# variable "container_registry_privatelink_subnet_id" {
#   type  = string
#   description = "(Required) Alternative range of IP address for Private Link"
# }

# variable "container_registry_network_rule_set" {
#   type = list(object(
#     { default_action : string, 
#     ip_rule : list(object({
#          action : string, 
#          ip_range : string
#          }))
#         }))
#   description = "A list of rule set."
#   default = [{
#     default_action = "Deny"
#     ip_rule         = [
#       {
#         action   = "Allow"
#         ip_range = "6.8.15.1/32"
#       }]
#   }]
# }

# variable "container_registry_private_dns_zone_ids" {
#   type  = string
#   description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
# }

# variable "tags" {
#   type        = map(string)
#   description = "Tags"
#   default     = {}
# }