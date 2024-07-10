output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3buckethosting.bucket
}


output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.s3buckethosting.arn
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.s3website.website_endpoint
}
