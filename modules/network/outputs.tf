output "network_name" {
  value = google_compute_network.vpc.name
}

output "subnetwork_name" {
  description = "O nome da sub-rede criada."
  value       = google_compute_subnetwork.subnetwork.name
}