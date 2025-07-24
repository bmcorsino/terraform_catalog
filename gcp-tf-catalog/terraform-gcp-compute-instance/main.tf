/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "google_compute_instance" "main" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project

  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  scratch_disk {
  }

  network_interface {
    network            = var.vm_network_interface
    subnetwork         = var.gcp_subnet_name
    subnetwork_project = var.project
    access_config {}
  }
}