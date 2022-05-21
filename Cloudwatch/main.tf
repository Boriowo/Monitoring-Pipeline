# Configure the AWS Provider
provider "aws" {
  region        = "aws-east-1"
}


# Create a module for collecting cloudwatchmetric filter
resource "aws_cloudwatch_log_metric_filter" "cloudwatch" {
  name           = var.name
  pattern        = ""
  log_group_name = aws_cloudwatch_log_group.dada.name

  metric_transformation {
    name         = var.metric_name
    namespace    = "YourNamespace"
    value        = "1"
  }
}

resource "aws_cloudwatch_log_group" "dada" {
  name           = var.logname
}