output "main" {
  value =   [aws_db_instance.main.identifier,
             aws_db_instance.main.engine,
             aws_db_instance.main.engine_version,
             aws_db_instance.main.instance_class,
             aws_db_instance.main.multi_az,
             aws_db_instance.main.username,
             aws_db_instance.main.db_name,
             aws_db_instance.main.allocated_storage,
             aws_db_instance.main.max_allocated_storage,
             aws_db_instance.main.storage_type,
             aws_db_instance.main.backup_retention_period,
             aws_db_instance.main.auto_minor_version_upgrade,]
}

