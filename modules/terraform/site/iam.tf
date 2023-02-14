data "aws_iam_policy_document" "site_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = [var.origin_access_identity]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.domain_name}.${var.env}/*"
    ]
  }
}
