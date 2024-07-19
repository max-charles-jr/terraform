data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Public Review
resource "aws_instance" "stds_dev_instance" {
  count                  = 2
  ami                    = var.ami_id
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = var.security_group_ids
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<EOF
#!/bin/bash

# Set hostname
hostnamectl set-hostname ${var.instance_name[count.index]}

# Update /etc/hosts
IP=$(hostname -I)
echo "$IP  ${var.instance_name[count.index]}.ieee.org  ${var.instance_name[count.index]}.awsi.ieee.org ${var.instance_name[count.index]}" >> /etc/hosts    
echo '140.98.112.51   satpav01.ieee.org       satpav01' >> /etc/hosts
echo '140.98.211.30   satpav02.ieee.org       satpav02' >> /etc/hosts    

# Configure Dynatrace agent
mkdir -p /var/log/dynatrace/oneagent/installer     
/opt/dynatrace/oneagent/agent/tools/oneagentctl --set-network-zone=aws.qa_environment.dyntrqav21 --set-host-group=PRVW-QA --restart-service    
EOF

  tags = {
    "Name"        = var.instance_name[count.index]
    "Application" = var.application
    "OU"          = var.ou
    "Environment" = var.environment
    "Patch Group" = var.ieee_patch_group[count.index]
  }

  volume_tags = {
    "Name"        = var.instance_name[count.index]
    "Application" = var.application
    "OU"          = var.ou
    "Environment" = var.environment
    "Patch Group" = var.ieee_patch_group[count.index]
  }
}
