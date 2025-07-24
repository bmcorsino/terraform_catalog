/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "google_compute_network" "vpc" {
  name                    = var.gcp_vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.gcp_subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc.id
}