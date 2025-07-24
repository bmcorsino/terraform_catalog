/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_lb" "main" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_is_internal
  load_balancer_type = var.aws_lb_type
  security_groups    = var.aws_sg_lb_id
  subnets            = var.aws_subnet_ids

  ip_address_type = var.ip_address_type

  enable_deletion_protection        = var.enable_deletion_protection
  enable_cross_zone_load_balancing  = var.enable_cross_zone

  tags = var.tags
}