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

