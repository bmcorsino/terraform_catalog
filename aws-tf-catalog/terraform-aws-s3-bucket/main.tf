/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

##CREATE S3 BUCKET
resource "aws_s3_bucket" "main" {
  bucket              = var.aws_s3_name
  object_lock_enabled = var.aws_s3_object_lock_enabled
  tags                = var.tags
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = var.aws_s3_object_ownership
  }
}
resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id

  block_public_acls       = var.aws_s3_block_public_acls
  block_public_policy     = var.aws_s3_block_public_policy
  ignore_public_acls      = var.aws_s3_ignore_public_acls
  restrict_public_buckets = var.aws_s3_restrict_public_buckets
}
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = var.aws_s3_versioning_status
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    apply_server_side_encryption_by_default{
      kms_master_key_id = var.aws_kms_key_id
      sse_algorithm     = "aws:kms"
    }
  }
}