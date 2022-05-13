# Configure the AWS Provider
provider "aws" {
  region        = "us-east-1"
}


# Create a module for collecting cloudwatchmetric filter
resource "aws_cloudwatch_log_metric_filter" "cloudwatch" {
  name           = "MyAppAccessCount"
  pattern        = ""
  log_group_name = aws_cloudwatch_log_group.dada.name

  metric_transformation {
    name         = "EventCount"
    namespace    = "YourNamespace"
    value        = "1"
  }
}

resource "aws_cloudwatch_log_group" "dada" {
  name           = "MyApp/access.log"
}