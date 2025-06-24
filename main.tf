module "network" {
  source     = "./modules/network"
  network_name = "rede-joana"
  subnetwork_name = "subrede-joana"
  region       = var.region
}

module "vm" {
  source        = "./modules/vm"
  instance_name = "site-joana"
  zone          = var.zone
  subnetwork       = module.network.subnetwork_name
  ssh_pub_key   = file("/home/alisson/.ssh/id_ed25519.pub")
  service_account_email = google_service_account.vm_sa.email

}

module "bucket" {
  source = "./modules/bucket"
  bucket_name = "bucket-site-joana-24-06-25"
  location_name = var.region
}

resource "google_service_account" "vm_sa" {
  account_id   = "sa-vm-site-joana" // Um ID curto para a conta de serviço
  display_name = "Service Account para a VM do site Joana"
}

resource "google_storage_bucket_iam_member" "vm_access_to_bucket" {
  bucket = module.bucket.bucket_name
  role   = "roles/storage.objectAdmin" // Permite gerenciar objetos (ler, escrever, apagar)
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}