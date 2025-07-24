/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

##CREATE EBS VOLUME
resource "aws_ebs_volume" "main" {
  availability_zone       = var.aws_ebs_availability_zone
  encrypted               = var.aws_ebs_encrypted
  size                    = var.aws_ebs_volume_size
  type                    = var.aws_ebs_volume_type
  kms_key_id              = var.aws_kms_key_id
  lifecycle {
        create_before_destroy = true
    }
}
### ATTACH EBS VOLUME TO EC2 INSTANCE
resource "aws_volume_attachment" "main" {
    device_name = var.aws_device_name
    volume_id   = aws_ebs_volume.main.id
    instance_id = var.aws_ec2_instance_id
}