// RESOURCE VARIABLES //
variable "identifier" {
  description = "Identifier for database"
  type        = string
}
variable "engine"  {
  description = "database engine type"
  type        = string
}
variable "engine_version" {
  description = "database engine version"
  type        = string
}
variable "instance_class" {
  description = "database instance classe"
  type        = string
}
variable "multi_az" {
  description = "database multi az availability"
  type        = bool
  default     = false
}
variable "availability_zone" {
  description = "database availability zone"
  type        = string
  default     = null
}
variable "character_set_name" {
  description = "database char set"
  type        = string
  default     = null
}
variable "tags" {
  description = "Database tags"
  type        = map(any)
  default     = null
}
variable "db_subnet_group_name" {
 description = "Subnet Group Name"
 type        = string
 default     = null
}
// CREDENTIALS VARIABLES //
variable "username" {
  description = "database master username"
  type        = string
}
variable "password" {
  description = "database master password"
  type        = string
}
variable "db_name" {
  description = "database name"
  type        = string
  default     = null
}
// STORAGE VARIABLES //
variable "allocated_storage" {
  description = "database storage allocation"
  type        = number
}
variable "max_allocated_storage" {
  description = "database max allocated storage"
  type        = number
  default     = null
}
variable "storage_encrypted" {
  description = "database storage encryption"
  type        = bool
  default     = false
}
variable "storage_type" {
  description = "database storage type"
  type        = string
  default     = null
}
variable "iops" {
  description = "database iops"
  type        = number
  default     = null
}
variable "backup_window"{
  description = "database backup window"
  type        = string
  default     = null
}
// SECURITY VARIABLES //
variable "publicly_accessible"{
  description = "database accessability options"
  type        = bool
  default     = null
}
variable "kms_key_id"{
  description = "database encryption key id"
  type        = string
  default     = null
}
variable "backup_retention_period" {
  description = "database backup retention period"
  type        = number
  default     = null
}
variable "auto_minor_version_upgrade" {
  description = "database auto minor version upgrade"
  type        = bool
  default     = null
}
variable "deletion_protection" {
  description = "database deletion protection"
  type        = bool
  default     = null
}
variable "skip_final_snapshot" {
  description = "database skip final snapshot"
  type        = bool
  default     = true
}
variable "vpc_security_group_ids" {
  description = "database security group"
  type        = list(any)
  default     = null
}


