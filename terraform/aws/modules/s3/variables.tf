variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "AWS region"
}

variable "bucket_name" {
  type        = string
  description = "S3 Bucket name"
}
