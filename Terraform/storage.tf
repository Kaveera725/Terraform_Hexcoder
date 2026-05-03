resource "google_storage_bucket" "terraform-demo" {
  name          = "hexcoder-docker-demo-487011-bucket"
  location      = "ASIA-SOUTH1"
  force_destroy = true

  uniform_bucket_level_access = true

  soft_delete_policy {
    retention_duration_seconds = 0
  }
}