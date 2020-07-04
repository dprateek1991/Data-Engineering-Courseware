resource "aws_iam_user_policy_attachment" "change_password_policy" {
  user       = "prateek.dubey"
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "billing_policy" {
  user       = "prateek.dubey"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_group_policy_attachment" "admin_policy" {
  group      = "admin"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}