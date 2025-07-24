output "subnet_cidr_blocks" {
  value = [for s in aws_subnet.main : s.id]
}

output "aws_vpc_id" {
  value = aws_vpc.main.id
}