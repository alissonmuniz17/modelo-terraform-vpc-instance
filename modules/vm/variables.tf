variable "instance_name" {
    type = string
    description = "nome da vm"
}
variable "zone" {
    type = string
    description = "zona da vm"
}
variable "subnetwork" {
    type = string
    description = "subrede que a vm pertence"
}
variable "ssh_pub_key" {
  type = string
  description = "chave publica ssh para conectar na vm"
  sensitive = true
}