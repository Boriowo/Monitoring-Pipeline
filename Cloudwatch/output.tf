output "cloudwatch_id" {
   description = "The Logs of the activities on my account"
   value = aws_cloudwatch_log_metric_filter.cloudwatch.id
}
output "loggroup_id" {
   description = "The Name of Logs of the activities on my account"
   value       = aws_cloudwatch_log_group.dada.id
}
