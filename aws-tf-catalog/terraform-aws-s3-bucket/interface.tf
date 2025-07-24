//RESOURCE VARIABLES //
variable "aws_s3_name"{
    description = "Name of the bucket"
}
variable "aws_s3_object_ownership" {
  description = "AWS S3 object ownership"
  type        = string
  default     = "BucketOwnerEnforced"
}
variable "tags" {
   description = "AWS S3 tags"
   type        = map(any)
   default     = null
}
//SECURITY VARIABLES //
variable "aws_s3_object_lock_enabled" {
    description = "This variable is to enabled or disabled the object lock"
    type        = bool
}
variable "aws_s3_versioning_status" {
    description = "This variable is to enabled, disabled or suspend the versioning status"
    type        = string
}
variable "aws_kms_key_id" {
    description = "A encryption key ID"
}
variable "aws_s3_block_public_acls" {
  description = "AWS S3 block public acls"
  type        = bool
  default     = true
}
variable "aws_s3_block_public_policy" {
  description = "AWS S3 block public policy"
  type        = bool
  default     = true
}
variable "aws_s3_ignore_public_acls" {
  description = "AWS S3 ignore public acls"
  type        = bool
  default     = true
}
variable "aws_s3_restrict_public_buckets" {
  description = "AWS S3 restrict public buckets"
  type        = bool
  default     = true
}
