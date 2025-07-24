/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_efs_file_system" "main" {
  availability_zone_name = var.availability_zone_name

  encrypted                       = var.encrypted
  performance_mode                = var.performance_mode
  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  kms_key_id                      = var.kms_key_id
  tags                            = var.tags
}

resource "aws_efs_mount_target" "main" {
  for_each        = var.availability_zone_name == null ? var.multi_subnet : var.single_subnet

  file_system_id  = aws_efs_file_system.main.id
  security_groups = var.security_groups
  subnet_id       = var.availability_zone_name == null ? var.aws_subnet_main_1[each.value].id : var.aws_subnet_main_2[each.value].id
  depends_on = [aws_efs_file_system.main]
}