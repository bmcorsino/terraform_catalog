# Load Balancer

Provides a VPC resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [VPC](#vpc)
- [Extra Fields](#extra_fields)
- [Output](#output)

## VPC<a name="vpc"></a>
```bash
module "aws_lb" {
    source            = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-vpc"
    cidr_block_vpc    = "10.0.0.0/16"
    vpc_id            = ""
    cidr_block_subnet = "10.0.1.0/24"
}
```

## Extra Fields<a name="extra_fields"></a>
```bash
    tags                                = { key = value }
```
