/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id
}