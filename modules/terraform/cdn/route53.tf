resource "aws_route53_zone" "primary" {
  name = "${var.domain_name}.${var.env}"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name = ""
  type = "A"
  alias {
    name = aws_cloudfront_distribution.my_site.domain_name
    zone_id = aws_cloudfront_distribution.my_site.hosted_zone_id
    evaluate_target_health = false
  }
}
