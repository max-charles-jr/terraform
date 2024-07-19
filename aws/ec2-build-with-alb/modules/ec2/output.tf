output "instance_id" {
  value = aws_instance.stds_dev_instance[*].id
}

output "instance_type" {
  value = aws_instance.stds_dev_instance[*].instance_type
}

output "instance_private_ip" {
  value = aws_instance.stds_dev_instance[*].private_ip
}

output "instance_subnet_id" {
  value = aws_instance.stds_dev_instance[*].subnet_id
}

output "instance_state" {
  value = aws_instance.stds_dev_instance[*].instance_state
}

output "instance_tags" {
  value = aws_instance.stds_dev_instance[*].tags_all
}
