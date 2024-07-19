variable "vpc_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
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
