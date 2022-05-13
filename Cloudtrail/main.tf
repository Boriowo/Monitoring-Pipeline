# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "ismiletech" {
  name                          = "tf-ismile-trail"
  s3_bucket_name                = aws_s3_bucket.ismile.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}

resource "aws_s3_bucket" "ismile" {
  bucket        = "tf-ismile-trail"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "ismile" {
  bucket = aws_s3_bucket.ismile.id
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
            "Resource": "${aws_s3_bucket.ismile.arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.ismile.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
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
