# Configure the AWS Provider
provider "aws" {
  region        = "us-east-1"
}

module "cloudwatch"{
    source       = "./Cloudwatch"
    name         = "Name"
    logname      = "MyApp/access.log" 
    metric_name  = "EventCount"   
}

module "cloudtrail"{
    source       = "./Cloudtrail"
    name         = "Cloudtrail"
    s3bucket     = "s3-Bucket"
}

module "Dashboard"{
    source       = "./Dashboard"
    dashboard    = "Dashboard"
    dashboard_body= <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "i-012345"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "us-east-1",
        "title": "EC2 Instance CPU"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 7,
      "width": 3,
      "height": 3,
      "properties": {
        "markdown": "Hello world"
      }
    }
  ]
}
EOF

}
