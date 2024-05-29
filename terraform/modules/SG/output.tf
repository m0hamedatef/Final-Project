output "private_lb_sg_id" {
    value = aws_security_group.private_lb_sg.id
}

output "public_lb_sg_id" {
    value = aws_security_group.public_lb_sg.id
}

output "private_instance_sg_id" {
    value = aws_security_group.private_instance_sg.id
}

output "public_instance_sg_id" {
    value = aws_security_group.public_instance_sg.id
}