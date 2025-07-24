variable "aws_lb_target_group_name" {
  description = "The target group name"
  type = string
}

variable "aws_lb_target_group_port" {
  description = "Port on which targets receive traffic"
  type = number
}

variable "aws_lb_target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets"
  type = string
}

variable "aws_lb_target_group_type" {
  description = "Type of target that you must specify when registering targets with this target group"
  type = string
}

variable "vpc_id" {
}