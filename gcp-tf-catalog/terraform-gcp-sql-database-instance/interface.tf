variable "gcp_cdb_name" {
    description = "Cloud SQL Database Instance Name"
    type        = string
}

variable "database_version" {
  type = string
  default = "POSTGRES_14"
}

variable "deletion_protection" {
  type = bool
  default = false
}

variable "tier" {
  type = string
  default = "db-f1-micro"
}