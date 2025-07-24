/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_cloudfront_distribution" "main" {
  origin {
    domain_name              = var.domain_name
    origin_id                = var.origin_id
  }

  enabled             = var.enabled
  default_root_object = var.default_root_object
}

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = var.target_origin_id
  }