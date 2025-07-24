# AWS Cloudfront Distribution

Creates an Amazon CloudFront web distribution.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index
  - [Cloudfront Distribution ](#cloudfront-distribution-)
  - [Observations ](#observations-)

## Cloudfront Distribution <a name="cloudfront_distribution"></a>
```bash

module "sqs_queue" {
  source              = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-cloudfront-distribution"
  domain_name         = ""             # DNS domain name of either the S3 bucket, or web site of your custom origin.
  origin_id           = "xxxx.xxxx.id" # Unique identifier for the origin.
  enabled             = ""             # true or false. Whether the distribution is enabled to accept end user requests for content
  default_root_object = "index.html"   # Object that you want CloudFront to return when an end user requests the root URL.
  allowed_methods  = ""                # Example: GET,UPDATE,... Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin.
  cached_methods   = ""                # Controls whether CloudFront caches the response to requests using the specified HTTP methods.
  target_origin_id = ""                # Value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior.
}

```

## Observations <a name="observations"></a>

