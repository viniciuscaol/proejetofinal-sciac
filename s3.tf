resource "aws_s3_bucket" "pfsc_s3" {
  bucket        = "projetofinal-s3-bucket"
  force_destroy = true

  tags = {
    Name = "SC ADA Projeto Final S3 Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "s3bucket_pab" {
  bucket                  = aws_s3_bucket.pfsc_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3bucket_policy" {
  bucket = aws_s3_bucket.pfsc_s3.id
  policy = local.policy
}