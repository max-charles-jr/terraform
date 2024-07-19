variable "alb_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "set_internal_alb" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}

variable "alb_security_groups" {
  type = list(string)
}

variable "target_group_name" {
  type = string
}

variable "target_group_port" {
  type = number
}

variable "target_group_protocol" {
  type = string
}

variable "alb_listener_port" {
  type = string
}

variable "alb_listener_protocol" {
  type = string
}

variable "acm_certificate_arn" {
  type = string
}

variable "application" {
  type = string
}

variable "ou" {
  type = string
}

variable "environment" {
  type = string
}

variable "ec2_instance_target_id" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
