//RESOURCE VARIABLES //
variable "aws_ec2_ami" {
  description = "AWS EC2 Instance - Amazon Machine Image"
  type        = string
}
variable "aws_ec2_instance_type" {
  description = "AWS EC2 Instance - Type"
}
variable "aws_ec2_availability_zone" {
  description = "AWS EC2 availability Zone"
}
variable "aws_ec2_subnet" {
  description = "AWS EC2 Subnet ID"
}
variable "aws_ec2_user_data" {
  description = "AWS EC2 Startup Script"
  default     = null
}
variable "tags" {
  description = "AWS EC2 tags"
  type        = map(any)
  default     = null
}
//CREDENTIALS VARIABLES//
variable "aws_iam_instance_profile" {
  description = "AWS Instance Profile"
  default = null
}

//STORAGE VARIABLES //
variable "aws_ec2_root_block_device_volume_type" {
  description = "AWS EC2 Root Volume Type"
}
variable "aws_ec2_root_block_device_volume_size" {
  description = "AWS EC2 Root Volume Size"
}
variable "managed_data_disk_list" {
  type = list(object({
    volume_size = number
    volume_type = string
    device_name = string
  }))
  default = []
}

//SECURITY VARIABLES //
variable "aws_ec2_security_groups" {
  description = "AWS EC2 Associated Security Groups"
}
variable "aws_kms_key_id" {
  description = "AWS kms for ebs volumes"
  default = null
}
variable "aws_ec2_delete_on_termination" {
  description = "AWS ebs delete on termination"
  default = true
}
variable "aws_ec2_encrypted" {
  description = "AWS ebs encryption"
  default = true
}
variable "aws_ec2_monitoring" {
  description = "AWS EC2 monitoring"
  default = true
}