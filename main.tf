# Configure the AWS Provider
provider "aws" {
  region        = "us-east-1"
}

module "cloudwatch"{
    source       = "./Cloudwatch"
    name         = "Name"
    logname      = "MyApp/access.log"    
}

module "cloudtrail"{
    source       = "./Cloudtrail"
    name         = "Cloudtrail"
    s3bucket     = "s3"
    key          = "Key"
}

module "Dashboard"{
    source       = "./Dashboard"
    dashboard    = "Dashboard"
}
