// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}" //credentials file
 project     = "xxxxxxxxxxxx"
 region      = "us-west1"
}

resource "google_compute_instance" "default" {
  name         = "${var.name}"
  machine_type = "machine_type"
  zone         = "${var.zone}"
  labels = {
    environment = "dev"
  }


  boot_disk {
    initialize_params {
      image = "image_name"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "galera-vpc" //assign already created vpc
  }

  lifecycle {
    ignore_changes = ["attached_disk"]

}

metadata {
    role = "dbhost"
    sshKeys = "${file(var.ssh_key)}"
    ssh_username = "${var.ssh_user}"
  }
}


resource "google_compute_disk" "default" {
  name  = "${var.disk_name}"
  type  = "pd-standard"
  zone  = "${var.zone}"
  size  = "${var.size}"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "default" {
  disk = "${google_compute_disk.default.self_link}"
  instance = "${google_compute_instance.default.self_link}"
}
