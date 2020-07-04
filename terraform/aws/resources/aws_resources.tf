module "s3_bucket_dataengineeringe2e" {
  source        = "./s3-bucket"
  bucket_name   = "dataengineeringe2e"
}

module "iam_user_group_prateek_dubey" {
  source                = "./iam-user-group-role-policy"
  iam_group_name        = "admin"
  iam_group_policy_name = "admin"
  iam_user_name         = "prateek.dubey"
}