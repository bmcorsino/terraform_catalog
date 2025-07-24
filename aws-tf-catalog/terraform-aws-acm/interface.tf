variable "sub_domain_name" {
  type = string
  validation {
    condition     = can(regex("^*.aws.piscapisca.pt", var.sub_domain_name))
    error_message = "Err: provided sub domain is not valid."
  }
}

variable "private_zone" {
  type    = bool
  default = false
}

variable "validation_method" {
  type    = string
  default = "DNS"
}
variable "hosted_zone_name" {
  type        = string
}
variable "ttl" {
  type = number
}