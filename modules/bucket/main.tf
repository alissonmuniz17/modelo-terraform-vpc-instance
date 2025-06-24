resource "google_storage_bucket" "bucket_imagem" {
  name          = var.bucket_name
  location      = var.location_name
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  lifecycle_rule {
    # Move para Nearline após 30 dias
    condition {
      age = 30
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

  lifecycle_rule {
    # Move para Coldline após 90 dias
    condition {
      age = 90
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}