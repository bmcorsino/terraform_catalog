# ACM Certificate

Provides a ACM certificate with validation and route53 record


## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [ACM Certificate](#acm-certificate)
- [Extra Fields](#extra_fields)

## ACM Certificate <a name="acm-certificate"></a>
```bash
module "aws_acm_certificate" {
    source            = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-acm"
    domain_name       = "example.com"
    validation_method = "DNS"
    hosted_zone_name  = "example" # Route53 hosted zone name
}
```

## Extra Fields <a name="extra_fields"></a>
``` bash
    validation_option {
        domain_name       = "testing.example.com"
        validation_domain = "example.com"
    }
    tags                            = { key = value }

    ## Route53 record ##
    ttl = 60
    private_zone      = false

```