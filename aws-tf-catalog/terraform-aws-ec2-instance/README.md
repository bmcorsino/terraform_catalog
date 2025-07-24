# EC2 Instance

Provides an EC2 instance resource. This allows instances to be created, updated, and deleted. Instances also support provisioning.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Virtual Machine - Linux](#ec2_instance)
- [Extra Fields](#extra_fields)
- [Output](#output)
- [Observations](#observations)

## EC2 Instance - Linux <a name="ec2_instance"></a>
```bash

module "ec2_instance" {
  source                                  = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-ec2-instance"
  aws_ec2_ami                             = "ami-xxxxxxxxxxxxxxxxxx"
  aws_ec2_availability_zone               = "<<availability_zone>>"
  aws_ec2_subnet                          = "subnet-xxxxxxxxxxxxxxx"
  aws_ec2_instance_type                   = "<<instance_type>>"
  aws_ec2_security_groups                 = ["sg-xxxxxxxxxxxxxxxxx"]
  aws_ec2_root_block_device_volume_size   = 10
  aws_ec2_root_block_device_volume_type   = "gp2"
  managed_data_disk_list                  = [
                                            { device_name = "/dev/sdb"
                                              volume_size = "10"
                                              volume_type = "gp3" }
                                            ]
}

```
## Extra Fields<a name="extra_fields"></a>

```bash
  tags                                    = { key = "<<value>>" }
  aws_ec2_user_data                       = "${file("<<path_to_user_data.sh>>")}"
  aws_iam_instance_profile                = "<<instance_profile>>"
  aws_kms_key_id                          = "<<key_id>>"
  managed_data_disk_list                  = [
                                            { device_name = "/dev/sdc"
                                              volume_size = "10"
                                              volume_type = "gp3" }
                                            ]
```
## Output<a name="output"></a>
```bash
output "main" {
value = aws_instance.main
}
```
## Observations <a name="observations"></a>

- **tags :** Use it to add additional tags in the format of ***{key = "value"}*** (Optional).
- **aws_ec2_user_data :** Use if any *bash code* or *script* needs to be run at instance creation (Optional).
- **aws_iam_instance_profile :**  Use to attach a specific *IAM instance profile* (Optional).
- **aws_kms_key_id :** Use to encrypt/decrypt *EBS volumes* with specific *KMS key*. If *null* it will encrypt with *AWS Managed Key* for EBS (Optional).

---
>Obs: All information was retrieved from [*Terraform Documentation*][link_2] and [*AWS*][link_1].

[link_1]:https://docs.aws.amazon.com/
[link_2]:https://registry.terraform.io/