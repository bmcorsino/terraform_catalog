/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc

  tags = var.tags
}

resource "aws_subnet" "main" {
  for_each   = toset(var.cidr_block_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = var.availability_zone
}