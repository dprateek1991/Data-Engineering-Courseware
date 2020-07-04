resource "google_storage_bucket" "cloud_storage" {
  name                  = var.bucket_name
  location              = var.location
  force_destroy         = false
  bucket_policy_only    = true
}