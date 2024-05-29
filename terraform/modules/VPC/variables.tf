variable "name" {
  type = string
  description = "Name of the project"
}

variable "region" {
  type = string
  description = "Name of the region"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block for vpc. ex: 10.0.0.0/16"
}

# variable "private_subnet_config" {
#   type = map(any)       # (any) means that's going to accept any type of values
#   description = "This map variable contains all the required variables for the private subnet resource"
# }

variable "public_subnet_config" {
  type = map(any)       # (any) means that's going to accept any type of values
  description = "This map variable contains all the required variables for the public subnet resource"
}

