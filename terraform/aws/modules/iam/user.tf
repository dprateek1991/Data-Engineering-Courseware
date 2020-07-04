resource "aws_iam_user" "iam_user" {
  name = var.iam_user_name

  tags = {
    Name    = var.iam_user_name
  }
}

resource "aws_iam_user_group_membership" "iam_user_group" {
  user = aws_iam_user.iam_user.name

  groups = [
    aws_iam_group.iam_group.name
  ]
}