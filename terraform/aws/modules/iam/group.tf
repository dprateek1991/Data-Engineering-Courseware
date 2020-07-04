resource "aws_iam_group" "iam_group" {
  name = var.iam_group_name
}

resource "aws_iam_group_policy" "iam_group_policy" {
  name   = var.iam_group_policy_name
  group  = aws_iam_group.iam_group.id
  policy = data.aws_iam_policy_document.iam_admin_policy_document.json
}

data "aws_iam_policy_document" "iam_admin_policy_document" {
  statement {
    sid    = "CreateMFA"
    effect = "Allow"
    actions = [
      "iam:DeactivateMFADevice",
      "iam:ListVirtualMFADevices",
      "iam:CreateVirtualMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:EnableMFADevice"
    ]
    resources = ["*"]
  }

  statement {
    sid     = "CanAssumeAllRoles"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    resources = ["*"]
  }

  statement {
    sid    = "AdministratorAccess"
    effect = "Allow"

    actions   = ["*"]
    resources = ["*"]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}