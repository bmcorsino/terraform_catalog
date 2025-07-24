/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

##CREATE A RDS INSTANCE
resource "aws_db_instance" "main" {
  identifier                 = var.identifier
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  multi_az                   = var.multi_az
  availability_zone          = var.availability_zone
  character_set_name         = var.character_set_name
  username                   = var.username
  password                   = var.password
  db_name                    = var.db_name
  db_subnet_group_name       = var.db_subnet_group_name
  allocated_storage          = var.allocated_storage
  max_allocated_storage      = var.max_allocated_storage
  storage_encrypted          = var.storage_encrypted
  storage_type               = var.storage_type
  iops                       = var.iops
  backup_window              = var.backup_window
  publicly_accessible        = var.publicly_accessible
  kms_key_id                 = var.kms_key_id
  backup_retention_period    = var.backup_retention_period
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deletion_protection        = var.deletion_protection
  skip_final_snapshot        = var.skip_final_snapshot
  vpc_security_group_ids     = var.vpc_security_group_ids
  tags                       = var.tags
  license_model              = "license-included"
}