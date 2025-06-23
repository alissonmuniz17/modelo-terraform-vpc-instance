variable "project_id" {
    type = string
    description = "id do projeto"
}

variable "region" { 
    type = string
    description = "região padrão do projeto"
}

variable "credentials_file" {                     
  type = string                                   
  description = "caminho para as credenciais"
  sensitive = true                                                       
    
}