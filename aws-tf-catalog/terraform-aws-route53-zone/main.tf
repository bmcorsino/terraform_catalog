/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_route53_zone" "HostedZone" {
  name      = var.domain_name
  comment   = var.comment

  dynamic "vpc" {
    for_each = var.private == true ? [1] : []
    content {
      vpc_id     = var.vpc_id
      vpc_region = var.vpc_region
    }
  }
}