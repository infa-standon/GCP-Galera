// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "xxxxxxxxx"
 region      = "us-west4"
}

#maincode
resource "google_compute_network" "new-vpc" {
  name                    = "${var.name}"  //assign name from variables.tf
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
  description             = "This module creates a VPC - if auto_create_subnetworks is set to true, a subnet for each reagion will be created automatically"
}
