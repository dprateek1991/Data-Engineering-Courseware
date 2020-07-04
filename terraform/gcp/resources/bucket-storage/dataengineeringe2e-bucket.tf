module "dataengineeringe2e_bucket" {
    source      = "../../modules/storage/"
    bucket_name = var.bucket_name
}