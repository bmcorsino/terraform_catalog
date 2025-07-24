/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

### CREATE EC2 INSTANCE
resource "aws_instance" "main" {
  ami               = var.aws_ec2_ami
  availability_zone = var.aws_ec2_availability_zone
  instance_type     = var.aws_ec2_instance_type
  subnet_id         = var.aws_ec2_subnet
  tags              = var.tags
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }
  root_block_device {
    volume_size           = var.aws_ec2_root_block_device_volume_size
    volume_type           = var.aws_ec2_root_block_device_volume_type
    delete_on_termination = var.aws_ec2_delete_on_termination
    encrypted             = var.aws_ec2_encrypted
    kms_key_id            = var.aws_kms_key_id
  }
  dynamic "ebs_block_device" {
    for_each = var.managed_data_disk_list
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      encrypted             = var.aws_ec2_encrypted
      delete_on_termination = var.aws_ec2_delete_on_termination
      kms_key_id            = var.aws_kms_key_id
    }
  }
  monitoring                = var.aws_ec2_monitoring
  vpc_security_group_ids    = var.aws_ec2_security_groups
  iam_instance_profile      = var.aws_iam_instance_profile
  user_data                 = var.aws_ec2_user_data
  lifecycle {
    create_before_destroy = true
  }
}