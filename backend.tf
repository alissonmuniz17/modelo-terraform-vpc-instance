terraform {
  backend "gcs" {
    bucket  = "terraform-state-modelo" // Use o nome exato do bucket que você criou
    prefix  = "terraform/state"              // É uma boa prática organizar o estado em uma "pasta" dentro do bucket
  }
}