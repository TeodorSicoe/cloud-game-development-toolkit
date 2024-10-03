# resource "aws_iam_policy" "terraform_s3_access_policy" {
# #   name        = "${var.project_prefix}-terraform-s3-access-policy"
#   description = "Policy granting Terraform access to the S3 bucket for state storage."
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:ListBucket",
#           "s3:DeleteObject"
#         ],
#         Resource = [
#           "arn:aws:s3:::tfstate-s3-bucket",
#           "arn:aws:s3:::tfstate-s3-bucket/*"
#         ]
#       }
#     ]
#   })
# }
#
# resource "aws_iam_role_policy_attachment" "attach_terraform_s3_access_policy" {
#   role       = aws_iam_role.unreal_horde_task_execution_role.name
#   policy_arn = aws_iam_policy.terraform_s3_access_policy.arn
# }