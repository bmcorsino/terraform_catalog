# S3 Bucket

Provides a S3 bucket resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [S3 Bucket](#s3_bucket)
- [Extra Fields](#extra_fields)
- [Output](#output)
- [Observations](#observations)

## S3 Bucket <a name="s3_bucket"></a>
```bash
module "aws_s3_bucket" {
  source                         = "git::https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/terraform-aws-s3-bucket"
  aws_s3_name                    = "appa-dev-s3-01"
  aws_s3_object_lock_enabled     = "false"
  aws_s3_versioning_status       = "Disabled"
}
```
Object Lock - [Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)<br>
Versioning Status - [Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html)<br>

## Extra Fields<a name="extra_fields"></a>

```bash
  key_id                         = "<<key_id>>"
  aws_s3_block_public_acls       = true | false
  aws_s3_block_public_policy     = true | false
  aws_s3_ignore_public_acls      = true | false
  aws_s3_restrict_public_buckets = true | false
  tags                           ={ key = "<<value>>" }
```

## Output<a name="output"></a>
```bash
output "main" {
  value = aws_s3_bucket.main
}
```
## Observations <a name="observations"></a>

- **aws_s3_key_id :** Use to encrypt/decrypt S3 bucket (Optional).
- [**aws_s3_block_public_acls :**][link_1] Whether Amazon *S3* should block public ACLs for this bucket. Enabling this setting does not affect existing policies or ACLs (Optional).
- [**aws_s3_block_public_policy :**][link_1] Whether Amazon *S3* should block public bucket policies for this bucket. Enabling this setting does not affect the existing bucket policy (Optional).
- [**aws_s3_ignore_public_acls  :**][link_1] Whether Amazon *S3* should ignore public ACLs for this bucket. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set (Optional).
- [**aws_s3_restrict_public_buckets  :**][link_1] Whether Amazon *S3* should restrict public bucket policies for this bucket. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked (Optional).
- **tags :** Use it to add additional tags in the format of ***{key = "value"}*** (Optional).
---
>Obs: All information was retrieved from [*Terraform Documentation*][link_2]

[link_1]:https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
[link_2]:https://registry.terraform.io/