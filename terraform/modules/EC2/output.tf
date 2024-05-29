output "public_ec2_ips" {
  value = aws_instance.public[*].public_ip
}
output "public_ec2_ids" {
  value = aws_instance.public[*].id
}

output "public_ec2_arns" {
  value = aws_instance.public[*].arn
}