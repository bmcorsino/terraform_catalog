# RDS Cluster

Manages a RDS Aurora Cluster.

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
- [Observations](#Observations)

## RDS <a name="rds"></a>
```bash
module "aws_rds_cluster"  {
  source                  = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-rds-cluster"
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  db_subnet_group_name    = ""
  create_instance         = 0        # 0 or 1. A flag that dictates if you want to create a instance or not.  
}
```

## Extra Fields<a name="extra_fields"></a>
```bash
  storage_encrypted    = false        # true or false
  skip_final_snapshot  = false        # true or false
  deletion_protection  = false        # true or false
  kms_key_id           = ""           # When specifying kms_key_id, storage_encrypted needs to be set to true
  tags                 = ""
##################################### Cluster Instance #############################################
  identifier           = ""          # Id of cluster instance. If none is specified it will be generated randomly
  instance_class       = ""          # For more information check the observations field
  db_subnet_group_name = ""
  availability_zone    = ""
```

## Observations <a name="Observations"></a>
```
hcl
- instance_class =  The instance class to use. For details on CPU and memory, see: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Aurora.Managing.html

```