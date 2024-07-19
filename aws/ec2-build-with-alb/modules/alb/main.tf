data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_lb" "stds_alb" {
  name               = var.alb_name
  internal           = var.set_internal_alb
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnet_ids
  security_groups    = var.alb_security_groups

  #   enable_deletion_protection = false
  #     access_logs {
  #         bucket = aws_s3_bucket.msdrd-elb-logs.bucket
  #         enabled = true
  #         prefix = ""
  #     }

  tags = {
    "Name"        = var.alb_name
    "Application" = var.application
    "OU"          = var.ou
    "Environment" = var.environment
  }
}

resource "aws_lb_target_group" "stds_target_grp" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    enabled = true
    path    = "/public-review-web/"
  }

  tags = {
    Name          = var.target_group_name
    "Application" = var.application
    "OU"          = var.ou
    "Environment" = var.environment
  }
}

resource "aws_lb_target_group_attachment" "stds_target_grp_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.stds_target_grp.arn
  target_id        = var.ec2_instance_target_id[count.index]
  port             = var.target_group_port
}

resource "aws_lb_listener" "stds_alb_listener" {
  load_balancer_arn = aws_lb.stds_alb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_port == 443 ? "HTTPS" : "HTTP"

  dynamic "default_action" {
    for_each = var.alb_listener_port == 443 ? [1] : []
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.stds_alb_target_group.arn
    }
  }

  certificate_arn = var.alb_listener_port == 443 ? var.acm_certificate_arn : null

  tags = {
    "Application" = var.application
    "OU"          = var.ou
    "Environment" = var.environment
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.stds_target_grp.arn
  }
}
