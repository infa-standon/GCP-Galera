// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}" . //credentials file with path
 project     = "xxxxxxxxxxx" 
 region      = "us-west1"
}
// code for firewall
resource "google_compute_firewall" "galera-firewall-west" {
  name    = "galera-firewall-west"
  network = "galera-vpc"

  allow {
    protocol = "tcp"
    ports    =["x","x"] //x=port
  }

  allow {
    protocol = "udp"
    ports    = ["X"] . //x=port
  }
}
