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

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"] // Permite que a VM acesse todas as APIs do GCP que a conta de serviço tiver permissão
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }

  metadata = {
    ssh-keys = "alissonmuniz17:${var.ssh_pub_key}"
  }

  metadata_startup_script = <<-EOT
  #!/bin/bash
  
  # Garante que a lista de pacotes esteja atualizada
  apt-get update -y

  # Instala o Nginx. O "-y" confirma automaticamente a instalação.
  apt-get install -y nginx

  # Inicia o serviço do Nginx
  systemctl start nginx

  # Habilita o Nginx para iniciar automaticamente em futuros reboots
  systemctl enable nginx

  # Instala o Git
  apt-get install -y git

  # Pequena mensagem para confirmar que o script rodou
  echo "<h1>Instalacao do Nginx concluida com Terraform!</h1>" > /var/www/html/index.nginx-debian.html
EOT
}