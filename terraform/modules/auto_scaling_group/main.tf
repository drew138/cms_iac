resource "aws_security_group" "sg_webcms" {
  name        = "sgWebCMS"
  description = "Allows HTTP Access"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Permit Web Requests from 172.16.1.0/24"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["172.16.1.0/24"]
  }

  ingress {
    description      = "Permit Web Requests from 172.16.4.0/24"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["172.16.4.0/24"]
  }

  ingress {
    description      = "Permit SSH connections from 172.16.1.0/24"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.16.1.0/24"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sgWebCMS"
  }

  revoke_rules_on_delete = true
}

resource "aws_launch_template" "template_webcms" {
  name_prefix   = "template-WebCMS"
  image_id      = var.ami
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.sg_webcms.id]
  }

  # vpc_security_group_ids = [aws_security_group.sg_webcms.id]


  tags = {
    Name = "template-WebCMS"
  }
}

resource "aws_autoscaling_group" "asg_webcms" {
  launch_template {
    id      = aws_launch_template.template_webcms.id
    version = "$Latest"
  }
  vpc_zone_identifier  = var.subnet_ids

  target_group_arns = [var.cms_target_group_arn]
  health_check_type = "ELB"
  health_check_grace_period = 90

  # Cloud Watch Metrics
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
    "GroupInServiceCapacity",
    "GroupPendingCapacity",
    "GroupStandbyCapacity",
    "GroupTerminatingCapacity",
    "GroupTotalCapacity",
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
  ]

  min_size = 2
  max_size = 2

  tag {
    key                 = "Name"
    value               = "ag-WebCMS"
    propagate_at_launch = true
  }
}
