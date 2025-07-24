# Load Balancer

Provides a Load Balancer resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Load Balancer](#lb)
- [Extra Fields](#extra_fields)
- [Output](#output)

## Load Balancer<a name="lb"></a>
```bash
module "aws_lb" {
    source = "git::https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog"
    name               = "test-lb-tf"
    internal           = false     # load balancer is internal or not internal
    load_balancer_type = "network" # network, application or gateway
    security_groups    = "" # The security group id for the load balancer
    subnets            = [] # List with subnet ids
}
```

## Extra Fields<a name="extra_fields"></a>
```bash
    enable_deletion_protection          = false
    enable_cross_zone_load_balancing    = false #  For network and gateway type load balancers, this feature is disabled by default
    tags                                = { key = value }
```

## Output<a name="output"></a>
```bash
output "main" {
value = aws_lb.main
}
```