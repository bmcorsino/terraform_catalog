# Load Balancer

Provides a security group resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Security Group](#sg)
- [Extra Fields](#extra_fields)

## Security Group`<a name="sg"></a>`

```bash
module "aws_sg" {
    source            = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-security-group"
    sg_name           = ""
    description       = ""
    vpc_id            = ""
}
```

## Extra Fields`<a name="extra_fields"></a>`

```bash
    tags                                = { key = value }
```
