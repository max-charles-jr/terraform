output "vpc_id" {
  value = aws_lb.stds_alb.vpc_id
}

output "alb_name" {
  value = aws_lb.stds_alb.name
}

output "alb_arn" {
  value = aws_lb.stds_alb.arn
}

output "alb_dns_name" {
  value = aws_lb.stds_alb.dns_name
}

output "alb_id" {
  value = aws_lb.stds_alb.id
}

output "alb_type" {
  value = aws_lb.stds_alb.load_balancer_type
}

output "alb_deletion_protection" {
  value = aws_lb.stds_alb.enable_deletion_protection
}

output "alb_idle_timeout" {
  value = aws_lb.stds_alb.idle_timeout
}

output "alb_tags" {
  value = aws_lb.stds_alb.tags_all
}
