data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = templatefile(
    "${path.module}/policies/s3-policy.json",
    {
      account_id = data.aws_caller_identity.current.account_id,
      region     = data.aws_region.current.name,
      bucket     = aws_s3_bucket.bucket.id
    }
  )
}
