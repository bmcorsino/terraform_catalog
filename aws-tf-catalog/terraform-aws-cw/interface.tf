variable "alarm_name" {
  type = string
}

variable "comparison" {
  type = string
}

variable "evaluation_periods" {
  type = number
}

variable "metric_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "period" {
  type = number
}

variable "statistic" {
  type = string
}

variable "description" {
  type = string
}

variable "insufficient_data_actions" {
  type = list(string)
}

variable "datapoints_to_alarm" {
  type = number
}

variable "threshold" {
  type = number
}

