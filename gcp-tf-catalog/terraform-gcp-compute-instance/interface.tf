variable "vm_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "project" {
  type = string
  default = null
}

variable "vm_image" {
  type    = string
  default = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
}

variable "vm_network_interface" {
  type = string
}

variable "gcp_subnet_name" {
    description = "Subnet name"
    type        = string
    default     = null
}

variable "tags" {
  default = []
}