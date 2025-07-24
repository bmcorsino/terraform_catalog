/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/



data "aws_route53_zone" "main_domain" {
  name         = var.hosted_zone_name
  private_zone = var.private_zone
}

resource "aws_acm_certificate" "main" {
  domain_name       = var.sub_domain_name
  validation_method = var.validation_method
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.main : record.fqdn]
  depends_on = [
    aws_route53_record.main
  ]
}

resource "aws_route53_record" "main" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.ttl
  type            = each.value.type
  zone_id         = data.aws_route53_zone.main_domain.zone_id
}
