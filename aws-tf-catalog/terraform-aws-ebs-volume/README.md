# EBS Volume

Manages a single EBS volume.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [EBS - Volume for Linux](#ebs_volume_linux)
- [EBS - Volume for Windows](#ebs_volume_windows)
- [Output](#output)
- [Observations](#observations)

## EBS Volume For Linux<a name="ebs_volume_linux"></a>
```bash
module "ebs_volume" {
    source = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-ebs-volume"
    aws_ebs_availability_zone   = "eu-west-1b"
    aws_ebs_volume_type         = "gp2"
    aws_ebs_volume_size         = 5
    aws_device_name             = "/dev/sdh"
    aws_ec2_instance_id         = "i-xxxxxxxxxxxxxx"
}
```
Device names on Linux instances - [Documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html)

## EBS Volume For Windows<a name="ebs_volume"></a>
```bash
module "ebs_volume" {
    source = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-ebs-volume"
    aws_ebs_availability_zone   = "eu-west-1b"
    aws_ebs_volume_type         = "gp2"
    aws_ebs_volume_size         = 5
    aws_device_name             = "xvdf"
    aws_ec2_instance_id         = "i-xxxxxxxxxxxxxx"
}
```
Device names on Windows instances - [Documentation](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/device_naming.html#available-ec2-device-names)

## Extra Fields<a name="extra_fields"></a>
```bash
    aws_ebs_encrypted           = true | false
    aws_kms_key_id              = "<<key_id>>"
```

## Output<a name="output"></a>
```bash
output "main" {
value = aws_ebs_volume.main
}
```
## Observations <a name="observations"></a>

- **aws_ec2_instance_id :** *EC2 instance ID* to attach *EBS Volumes* to (Required).
- **aws_kms_key_id :** Use to encrypt/decrypt *EBS volumes* with specific *KMS key*. If *null* it will encrypt with *AWS Managed Key* for EBS (Optional).
