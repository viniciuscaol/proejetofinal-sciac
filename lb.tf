# Loud Balancer Projeto Final ADA

resource "aws_lb" "scada_lb" {
  name               = "scada-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.scada_sgrds.id]
  subnets = [
    aws_subnet.publica_a.id,
    aws_subnet.publica_b.id,
    aws_subnet.publica_c.id
  ]


  enable_deletion_protection = false

  tags = {
    Name = "SCADA LB"
  }
}

resource "aws_lb_target_group" "scada_tg" {
  name            = "scada-tg"
  port            = 80
  protocol        = "HTTP"
  vpc_id          = aws_vpc.scpf_vpc.id
  ip_address_type = "ipv4"
  target_type     = "instance"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = "traffic-port"
  }

  tags = {
    Name = "SCADA LB TG"
  }
}

resource "aws_lb_listener" "scada_listener" {
  load_balancer_arn = aws_lb.scada_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.scada_tg.arn
  }

  tags = {
    Name = "SCADA LB Listener"
  }
}

resource "aws_lb_target_group_attachment" "scada_tg_attachment_a" {
  target_group_arn = aws_lb_target_group.scada_tg.arn
  target_id        = aws_instance.webapp_a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "scada_tg_attachment_b" {
  target_group_arn = aws_lb_target_group.scada_tg.arn
  target_id        = aws_instance.webapp_b.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "scada_tg_attachment_c" {
  target_group_arn = aws_lb_target_group.scada_tg.arn
  target_id        = aws_instance.webapp_c.id
  port             = 80
}
