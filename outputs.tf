output "instruções_de_acesso" {
  description = "Informações para acessar a nova instância."
  value = "O nome da instancia criada é '${module.vm.instance_name}' e sua vpc é '${module.network.network_name}'"
}