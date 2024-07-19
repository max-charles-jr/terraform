provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id           = var.vpc_id
  subnet_ids       = var.subnet_ids
  application      = var.application
  ou               = var.ou
  environment      = var.environment
  ieee_patch_group = var.ieee_patch_group

  ami_id               = var.ami_id
  security_group_ids   = var.security_group_ids
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  instance_name        = var.instance_name
}

module "alb" {
  source = "./modules/alb"

  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  application = var.application
  ou          = var.ou
  environment = var.environment

  alb_name               = var.alb_name
  set_internal_alb       = var.set_internal_alb
  load_balancer_type     = var.load_balancer_type
  alb_security_groups    = var.alb_security_groups
  target_group_name      = var.target_group_name
  target_group_port      = var.target_group_port
  target_group_protocol  = var.target_group_protocol
  alb_listener_port      = var.alb_listener_port
  alb_listener_protocol  = var.alb_listener_protocol
  acm_certificate_arn    = var.acm_certificate_arn
  ec2_instance_target_id = module.ec2.instance_id
}
