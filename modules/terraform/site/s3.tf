resource "aws_s3_bucket" "my_site" {
  bucket = "${var.domain_name}.${var.env}"
  acl = "public-read"
  policy = data.aws_iam_policy_document.site_policy.json
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  key    = "index.html"
  acl = "public-read"
  bucket = aws_s3_bucket.my_site.id
  source = "${path.module}/index.html"
  etag = filemd5("${path.module}/index.html")
  content_type = "text/html"
}
