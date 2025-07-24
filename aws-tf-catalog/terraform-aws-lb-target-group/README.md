# Load Balancer Target Group

Provides a Target Group resource for use with Load Balancer resources

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Target Group](#tg)
- [Extra Fields](#extra_fields)
- [Observations](#observations)
- [Output](#output)

## Target Group<a name="tg"></a>
```bash
module "aws_lb" {
    source      = "git::https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/terraform-aws-lb-target-group"
    name        = "test-lb-tg"
    port        = 80  # Port on which targets receive traffic. Not always required see observations for more information           
    protocol    = "HTTP"  # Protocol to use for routing traffic to the targets. Not always required see observations for more information. Ex: HTTP, UDP, TCP
    target_type = "ip"  #  Type of target that you must specify when registering targets with this target group. Not always required see observations for more information. Ex: ip, lambda
    vpc_id      = ""   
}
```

## Extra Fields<a name="extra_fields"></a>
```bash
```

## Observations <a name="observations"></a>

- **port :** Required when target_type is instance, ip or alb. Does not apply when target_type is lambda.
- **protocol :** Required when target_type is instance, ip or alb. Does not apply when target_type is lambda.
- **target_type :** Network Load Balancers do not support the lambda target type. Application Load Balancers do not support the alb target type.
---
>Obs: All information was retrieved from [*Terraform Documentation*]

[link_1]:https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group