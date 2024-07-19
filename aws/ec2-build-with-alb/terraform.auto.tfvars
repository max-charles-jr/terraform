region = "us-east-1"
subnet_ids = [
  "subnet-105ac066", # Dev-Private-AWS-AZB
  "subnet-4b1eac13", # Dev-Private-AWS-AZC
  "subnet-964436ab"  # Dev-Private-AWS-AZE
]

vpc_id      = "vpc-fb7d229f"
application = "PUBLIC REVIEW"
ou          = "STANDARDS"
environment = "QA"

ieee_patch_group = [
  "CLASS_J2_AMZN_LINUX_2_GROUP1",
  "CLASS_J2_AMZN_LINUX_2_GROUP2"
]

// EC2
ami_id = "ami-06daabc4ed3e71b33"
security_group_ids = [
  "sg-d806ada2", # IEEE-STDACC
  "sg-a6a6d9db"  # QA-PRW-WBI
]

instance_type        = "t4g.large"
iam_instance_profile = "prvw_qa_ec2_app_role"
instance_name = [
  "prvwqav24",
  "prvwqav25"
]


// ALB
alb_name           = "prvwqa-int"
set_internal_alb   = true
load_balancer_type = "application"
alb_security_groups = [
  "sg-079e0bf8e6b1d3bb0" # QA-PRW-APPE
]

target_group_name     = "prvwqa-tg-8690"
target_group_port     = 8690
target_group_protocol = "HTTP"

alb_listener_port     = 443
alb_listener_protocol = "HTTPS"
acm_certificate_arn   = "arn:aws:acm:us-east-1:779264004049:certificate/b88d041b-d878-40d9-b8b4-ff88d13c9c3d"
