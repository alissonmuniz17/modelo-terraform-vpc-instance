module "network" {
  source     = "./modules/network"
  network_name = "rede-joana"
  subnetwork_name = "subrede-joana"
  region       = var.region
}

module "vm" {
  source        = "./modules/vm"
  instance_name = "site-joana"
  zone          = "us-east4-a"
  subnetwork       = module.network.subnetwork_name
  ssh_pub_key   = file("/home/alisson/.ssh/id_ed25519.pub")
}