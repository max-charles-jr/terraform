variable "region" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
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

variable "ieee_patch_group" {
  type = list(string)
}

// EC2
variable "ami_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "instance_name" {
  type = list(string)
}


// ALB
variable "alb_name" {
  type = string
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
