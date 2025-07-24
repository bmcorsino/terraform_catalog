variable "cluster_identifier" {
    description = "The RDS Cluster Cluster Identifier"
    type = string
}
variable "availability_zone" {
    description = "The RDS Cluster Availability Zone"
    type = string
}
variable "database_name" {
    description = "The RDS Cluster Database name"
    type = string
}
variable "master_username" {
    description = "The RDS Cluster user"
    type = string
}
variable "master_password" {
    description = "The RDS Cluster password"
    type = string
}
variable "identifier" {
    description = "The RDS Cluster Identifier"
    type = string
}
variable "instance_class" {
    description = "The RDS Cluster Instance Class"
    type = string
}
variable "engine" {
    description = "The RDS Cluster engine"
    type = string
}
variable "engine_version" {
    description = "The RDS Cluster engine version"
    type = string
}
variable "db_subnet_group_name" {
    description = "The RDS Cluster subnet group name"
}
variable "tags" {
    description = "The RDS Cluster tags"
    type = map(string)
}
variable "deletion_protection" {
    description = "The RDS Cluster preferred backup window"
    type = bool
}
variable "skip_final_snapshot" {
    description = "The RDS Cluster preferred backup window"
    type = bool
}
variable "storage_encrypted" {
    description = "The RDS Cluster storage encrypted option"
    type = bool
}
variable "kms_key_id" {
    description = "The RDS Cluster kms key"
    type = string
}
variable "create_instance" {
    description = "Flag to create or not create an instance with the cluster"
    type = number
    default = 0
}