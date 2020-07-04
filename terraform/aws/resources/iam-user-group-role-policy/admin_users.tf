module "iam_group_admin" {
  source                = "../../modules/iam"
  iam_user_name         = var.iam_user_name
  iam_group_name        = var.iam_group_name
  iam_group_policy_name = var.iam_group_policy_name
}