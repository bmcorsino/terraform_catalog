# DB Subnet group

Provides an RDS DB subnet group resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [DB Subnet Group](#DB_Subnet_Group)
- [Output](#Output)
- [Observations](#Observations)

## Subnet Group <a name="DB_Subnet_Group"></a>
```bash
module "aws-db-subnet-group" {
 source      = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-db-subnet-group"
 name       = "<<name>>"
 subnet_ids = "[subnet-xxxxxxxxx,subnet-yyyyyyyy,subnet-zzzzzzzzz]"
 tags       = "{key=value}"
}
```
db_subnet_group - [Documentation](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Subnets)<br>

## Output <a name="Output"></a>
```bash
output "main" {
  values = [aws_db_subnet_group.main]
}
```
## Observations <a name="Observations"></a>
- **subnet_ids :** Ids of the subnets used to create subnet groups (Mandatory). Minimum *two subnets* in *two differents* availability zones.
- **name :** Specify the Name of an already existing subnet group. *Defaults to null create a new subnet group*.
- **tags :** Use it to add additional tags in the format of ***{key = "value"}*** (Optional).

---
>Obs: All information was retrieved from [*Terraform Documentation*][link_2] and [*AWS*][link_1].

[link_1]:https://docs.aws.amazon.com/
[link_2]:https://registry.terraform.io/