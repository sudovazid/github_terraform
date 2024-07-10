resource "aws_s3_bucket" "s3buckethosting" {
  bucket = var.bucket_name
  tags = {
    Name        = "website bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "s3website" {
  bucket = aws_s3_bucket.s3buckethosting.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.s3buckethosting.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3buckethosting.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3buckethosting.arn}/*"
      },
    ]
  })
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("${path.module}/website", "**/*")
  bucket   = aws_s3_bucket.s3buckethosting.id
  key      = each.value
  source   = "${path.module}/website/${each.value}"
  etag     = filemd5("${path.module}/website/${each.value}")

  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}

locals {
  mime_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
  }
}

