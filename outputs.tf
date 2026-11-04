output "site_estatico_url" {
  description = "URL HTTPS do CloudFront com origem no S3."
  value       = "https://${aws_cloudfront_distribution.scada_distribution_s3.domain_name}"
}

output "site_ec2_url" {
  description = "URL HTTPS do CloudFront com origem no balanceador."
  value       = "https://${aws_cloudfront_distribution.scada_distribution_lb.domain_name}"
}

output "balanceador_url" {
  description = "URL HTTP do ALB para teste direto das instancias."
  value       = "http://${aws_lb.scada_lb.dns_name}"
}

output "banco_endpoint" {
  description = "Endpoint MySQL, acessivel conforme as regras da rede privada."
  value       = aws_db_instance.scada_mysql.endpoint
}