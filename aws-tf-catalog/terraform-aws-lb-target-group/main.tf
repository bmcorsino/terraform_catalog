/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_lb_target_group" "main" {
  name        = var.aws_lb_target_group_name
  port        = var.aws_lb_target_group_port
  protocol    = var.aws_lb_target_group_protocol
  target_type = var.aws_lb_target_group_type
  vpc_id      = var.aws_vpc_id
}

