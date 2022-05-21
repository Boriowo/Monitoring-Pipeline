# Configure the AWS Provider
provider "aws" {
  region  = "aws-east-1"
}

# Create a Cloudwatch Dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name  = var.dashboard

  dashboard_body = var.dashboard_body

}