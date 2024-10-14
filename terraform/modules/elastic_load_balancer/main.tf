resource "aws_security_group" "sg_lb" {
  name        = "Load balancer security group"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc_id

  # Allow inbound HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "cms_lb" {

  name               = "ib-WebCMS"

  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.sg_lb.id]
}

resource "aws_lb_listener" "cms_lb_listener" {
  load_balancer_arn = aws_lb.cms_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cms_target_group.arn
  }
}

resource "aws_lb_target_group" "cms_target_group" {
  name        = "cms-target-group"
  port        = 80
  protocol    = "HTTP"
  protocol_version = "HTTP1"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    matcher             = "200,300-399"
  }
  tags = {
    Name = "tg-CMS"
  }
}

