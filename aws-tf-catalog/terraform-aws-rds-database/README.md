# RDS Instance

Provides an RDS instance resource. A DB instance is an isolated database environment in the cloud. A DB instance can contain multiple user-created databases.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [RDS](#rds)
- [Extra Fields](#extra_fields)
- [Output](#Output)
- [Observations](#Observations)

## RDS <a name="rds"></a>
```bash
module "aws-db-instance" {
source                       = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-rds-database"
  identifier                 = "rds-identifier"
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t3.micro"
  username                   = "admin"
  password                   = "pAssW0rd!"
  db_name                    = "db_name"
  allocated_storage          = 100
}
```
RDS - [Documentation](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html)<br>

## Extra Fields<a name="extra_fields"></a>
```bash
  multi_az                   = true | false
  storage_encrypted          = true | false
  publicly_accessible        = true | false
  auto_minor_version_upgrade = true | false
  deletion_protection        = true | false
  skip_final_snapshot        = true | false
  backup_retention_period    = 30
  max_allocated_storage      = 150
  iops                       = 3000
  storage_type               = "io1"| "gp2"
  kms_key_id                 = "<<key_id>>"
  backup_window              = "<<backup_window>>"
  availability_zone          = "<<availability_zone>>"
  character_set_name         = "<<character_set_name>>"
  tags                       = { key = "<<value>>" }

```
## Output<a name="Output"></a>
```bash
output "main" {
value = aws_db_instance.main
}

```
## Observations <a name="Observations"></a>
- **iops :**  Don't use if *storage_type* is different than *io1*.
- **kms_key_id :**  Use only if *storage_encrypted* equals *true*.
- **character_set_name :** Use it to indicate the specific *character set* (Optional).
- **availability_zone :** Use only when *multi_az* is *false* (Optional).
- **backup_window :** Specify a time interval for the backup (Optional).
- **tags :** Use it to add additional tags in the format of ***{key = "value"}*** (Optional).

---
>Obs: All information was retrieved from [*Terraform Documentation*][link_2] and [*AWS*][link_1].

[link_1]:https://docs.aws.amazon.com/
[link_2]:https://registry.terraform.io/