#!/bin/bash
set -euo pipefail

dnf install -y httpd

cat > /var/www/html/index.html <<HTML
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Laboratório AWS — Vinicius Caldas</title>
</head>
<body>
  <h1>Infraestrutura AWS com Terraform</h1>
  <p>Servidor: $(hostname)</p>
  <p>Aplicação de demonstração para teste do balanceador.</p>
</body>
</html>
HTML

systemctl enable --now httpd
