variable "bucket_name" {
    type        = string
    description = "GCP Cloud Storage Bucket Name"
}

variable "location" {
    type        = string
    default     = "ASIA-SOUTHEAST1"
    description = "GCP resource location"
}