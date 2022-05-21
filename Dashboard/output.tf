output "Dashboard_id" {
   description = "The Dashboard"
   value = aws_cloudwatch_dashboard.main
}

output "Dashboard_body_id" {
   description = "The Dashboard Body"
   value = aws_cloudwatch_dashboard.main
}
