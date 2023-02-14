output "origin_access_identity" {
  value = aws_cloudfront_origin_access_identity.my_site.iam_arn
}
