output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_type" {
  value = module.ec2.instance_type
}

output "instance_private_ip" {
  value = module.ec2.instance_private_ip
}

output "instance_subnet_id" {
  value = module.ec2.instance_subnet_id
}

output "instance_state" {
  value = module.ec2.instance_state
}

output "instance_tags" {
  value = module.ec2.instance_tags
}

output "vpc_id" {
  value = module.alb.vpc_id
}

output "alb_name" {
  value = module.alb.alb_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_id" {
  value = module.alb.alb_id
}

output "alb_type" {
  value = module.alb.alb_type
}

output "alb_deletion_protection" {
  value = module.alb.alb_deletion_protection
}

output "alb_idle_timeout" {
  value = module.alb.alb_idle_timeout
}

output "alb_tags" {
  value = module.alb.alb_tags
}
