# VPC

Manages a VPC network or legacy network resource on GCP


## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [VPC](#vpc)
- [Extra Fields](#extra_fields)

## VPC <a name="vpc"></a>
```bash
module "gcp_vpc" {
    source            = "https://github.kpmg.com/PT-CloudOps-Team/gcp-tf-catalog/tree/main/terraform-gcp-vpc"

    gcp_vpc_name            = "my-network"
    auto_create_subnetworks = false

    #### Subnet ######
    gcp_subnet_name         = "my-subnet"
    ip_cidr_range           = "10.0.1.0/24"
    region                  = "europe-west1"
}
```

## Extra Fields <a name="extra_fields"></a>
``` bash
    mtu = 1460  # Maximum Transmission Unit in bytes. The default value is 1460 bytes. The minimum value for this field is 1300 and the maximum value is 8896 bytes

```