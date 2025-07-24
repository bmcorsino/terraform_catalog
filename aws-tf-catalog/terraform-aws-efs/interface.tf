// RESOURCE VARIABLES //
variable "availability_zone_name" {
  default = null
}
variable "encrypted" {
  default = null
}
variable "performance_mode" {
  default = null
}
variable "provisioned_throughput_in_mibps" {
  type = number
  default = null
}
variable "throughput_mode" {
  type = string
}
variable "subnet_env" {
  default =({
  "app" = "application",
  "dat" = "data",
  "fro" = "frontend"
  })
}
variable "tags" {
  type    = map(any)
  default = null
}
variable "security_groups" {}
variable "multi_subnet"{}
variable "single_subnet" {}
variable "aws_subnet_main_1" {}
variable "aws_subnet_main_2" {}

//SECURITY VARIABLES //
variable "kms_key_id" {
  description = "kms key id for efs"
}

