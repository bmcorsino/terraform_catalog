# Compute Instance

Manages a VM instance resource within GCE.

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Compute Instance](#compute-instance)
- [Extra Fields](#extra_fields)

## Compute Instance `<a name="compute-instance"></a>`

```bash
module "gcp_compute_instance" {
    source            = "https://github.dxc.com/PT-CloudOps-Team/gcp-tf-catalog/tree/main/terraform-gcp-compute-instance"

    name         = "my-vm"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    image        = "ubuntu-minimal-2210-kinetic-amd64-v20230126"    # The image from which to initialize this disk
    network      = "default"                                        # Network to attach to the instance
}
```

## Extra Fields `<a name="extra_fields"></a>`

```bash
  tags            = ["foo", "bar"]
  project 	  = ""
  gcp_subnet_name = ""

  scratch_disk {
    interface     = "SCSI"
  }

```
