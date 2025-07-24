# EFS

Provides an Elastic File System (EFS) File System resource

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply

```
## Index

- [EFS](#efs)
- [Extra Fields](#extra_fields)
- [Observations](#observations)
- [Output](#output)

## EFS<a name="efs"></a>

```bash
module "aws_efs_file_system" {
    source = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-efs"
    availability_zone_name          = "eu-west-1a"
    encrypted                       = true
    performance_mode                = "generalPurpose"
    throughput_mode                 = "provisioned"
    provisioned_throughput_in_mibps = 12
    kms_key_id                      = "mrk-xxxxxx"
}
```
-EFS - [Documentation](https://aws.amazon.com/efs/)<br>


## Extra Fields <a name="extra_fields"></a>
``` bash
#### AWS EFS Mount Target #####

security_groups = ""            # A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified)

```

## Observations <a name="observations"></a>

- **encrypted :**  choose one : true or false.
- **performance_mode :**  choose one : "generalPurpose" or "maxIO".
- **throughput_mode :** choose one : "bursting" or "provisioned".
- **provisioned_throughput_in_mibps :** Necessary only if *throughtput_mode* is *provisioned*.
- **kms_key_id :** Necessary only if *encrypted* is *true*.

## Output<a name="output"></a>

```bash
output "main" {
    value = [aws_efs_mount_target.main,aws_efs_file_system.main]
}
```