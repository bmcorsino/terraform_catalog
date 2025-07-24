// RESOURCE VARIABLES //
variable "aws_ebs_volume_type" {
  description = " Aws EBS Volume Type." 
  type        = string
}
variable "aws_ebs_availability_zone"{
  description =  "AWS EBS Availability Zone (same as the Instance)"   
  type        = string
}
variable "aws_ebs_volume_size" {
  description = "Size of EBS Volumes to be attached (GB)"
  type        = number
}
variable "aws_ec2_instance_id" {
  description = "EC2 Instance ID to attach EBS Volume"
}
variable "aws_device_name" {
  description = "EBS Volume Name at attachment"
}
//SECURITY VARIABLES //
variable "aws_ebs_encrypted" {
  description = "EBS encrypt/decrypt option"
  type        = bool
  default     = true
}
variable "aws_kms_key_id" {
  description = "EBS encrypt/decrypt key"
  type        = string
  default     = null
}