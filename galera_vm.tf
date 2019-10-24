// Configure the Google Cloud provider
provider "google" {
  project = "xxxxxxxxx" //project where instance need to be created
  region  = "us-west1-a"
}

resource "google_compute_instance" "dbcluster-nodes" {
  name         = "${var.name}-${format("%02d", count.index + 1)}"
  description  = "${var.name} node #${format("%02d", count.index + 1)}"
  machine_type = "n1-standard-2"
  zone         = "${var.zone}"
  count        = "${var.cluster_size}"
  labels = {
    environment = "dev" // tags need to be added , all should be in small alphabets //
  }

  service_account {
    email  = "xxxxxxxxxx"
    scopes = ["xxxxxxxx"]
  }


  tags = ["mysql", "ssh", "galera", "maxscale"]

  boot_disk {
    initialize_params {
      image = "xxxxxxx" //BASE AMI
    }
  }

  network_interface {
    subnetwork         = "xxxxxxxx"
    subnetwork_project = "xxxxxxxxx"
    #    access_config {}
  }
}


resource "google_compute_disk" "dbcluster-lvm" {
  name  = "${var.name}-lvm-${format("%02d", count.index + 1)}"
  type  = "pd-standard"
  zone  = "${var.zone}"
  size  = "${var.size}"
  count = "${var.cluster_size}"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
