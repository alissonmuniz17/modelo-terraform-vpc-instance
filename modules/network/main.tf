resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false             # modo vpc customizada. Caso opte por 'true' (não customizado), ele criará uma sub-rede em cada uma das regiões do GCP que existem no mundo.
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}