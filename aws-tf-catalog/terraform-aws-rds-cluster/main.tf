/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_rds_cluster" "main" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password
  engine             = var.engine
  engine_version     = var.engine_version
  db_subnet_group_name = var.db_subnet_group_name
  tags = var.tags
  storage_encrypted = var.storage_encrypted
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection
  kms_key_id = var.kms_key_id
}

resource "aws_rds_cluster_instance" "main" {
  count              = var.create_instance ? 0 : 1 
  identifier         = var.identifier
  cluster_identifier = aws_rds_cluster.main.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.main.engine
  engine_version     = aws_rds_cluster.main.engine_version
  db_subnet_group_name = var.db_subnet_group_name
  availability_zone = var.availability_zone
  tags = var.tags
}