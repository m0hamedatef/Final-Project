variable "name" {
  type = string
  description = "Name of the project"
}

variable "ec2_config" {
  type = map(any)
}

variable "vpc_id" {
}

variable "public_subnet_ids" {
}

variable "public_instance_sg_id" {
}

# variable "privte_lb_dns" {
  
# }

/*
variable "apache_script" {
  type    = string
  description = "Content of the apache script file"
}

variable "proxy_script" {
  type    = string
  description = "Content of the proxy script file"
}
*/