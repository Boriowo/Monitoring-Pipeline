# Configure the AWS Provider
provider "aws" {
  region        = "us-east-1"
}

module "cloudwatch"{
    source       = "./Cloudwatch"
    loggroupname = "Ismile Cloudwatch"
}

module "cloudtrail"{
    source       = "./Cloudtrail"
    name         = "Ismile Cloudtrail"
    s3bucket     = "Ismile s3"
    key          = "Ismile Key"
}

module "Dashboard"{
    source       = "./Dashboard"
    dashboard    = "Ismile Dashboard"
}
