/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.description
  insufficient_data_actions = var.insufficient_data_actions
  datapoints_to_alarm       = var.datapoints_to_alarm
}