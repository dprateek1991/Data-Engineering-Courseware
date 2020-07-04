resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  region = var.aws_region

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name    = var.bucket_name
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}