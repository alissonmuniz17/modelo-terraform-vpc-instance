resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2404-noble-amd64-v20250606"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Hello from Terraform" > /var/tmp/hello.txt
  EOT
}