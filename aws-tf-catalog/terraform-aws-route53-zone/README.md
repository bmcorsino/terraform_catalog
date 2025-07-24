# Load Balancer

Provides a Route 53 Hosted zone resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Route53 Hosted Zone](#route53)
- [Extra Fields](#extra_fields)

## Route53 Hosted Zone `<a name="route53"></a>`

```bash
module "aws_route53" {
    	source            = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/terraform-aws-route53-zone"
	name 	= ""	   # domain name
	private = false    # true or false
}
```

## Extra Fields `<a name="extra_fields"></a>`

```bash
    comment    = ""
    vpc_id     = ""
    vpc_region = ""
```
