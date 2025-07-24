variable "domain_name" {
  type = string
}

variable "comment" {
  type = string
  default = null
}

variable "vpc_id" {
  type = string
  default = null
}

variable "vpc_region" {
  type = string
  default = null
}

variable "private" {
  type = string
  default = false
}