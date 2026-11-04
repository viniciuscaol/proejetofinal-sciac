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

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.pfsc_s3.id
  key          = "index.html"
  content_type = "text/html; charset=utf-8"

  content = <<-HTML
    <!DOCTYPE html>
    <html lang="pt-BR">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Laboratório AWS — Vinicius Caldas</title>
    </head>
    <body>
      <h1>Infraestrutura AWS com Terraform</h1>
      <p>Conteúdo estático armazenado em um bucket S3 privado.</p>
      <p>Distribuição pelo Amazon CloudFront com Origin Access Control.</p>
      <p>Projeto acadêmico de Vinicius Caldas Oliveira.</p>
    </body>
    </html>
  HTML
}