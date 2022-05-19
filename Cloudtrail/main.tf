# Configure the AWS Provider
provider "aws" {
  region = "aws-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "CloudTrail" {
  name                          = var.name
  s3_bucket_name                = var.s3bucket
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}

resource "aws_s3_bucket" "Bucket" {
  bucket        = var.s3bucket
  force_destroy = true
}

resource "aws_s3_bucket_policy" "your-policy" {
  bucket = aws_s3_bucket.Bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.Bucket.arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.Bucket.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
