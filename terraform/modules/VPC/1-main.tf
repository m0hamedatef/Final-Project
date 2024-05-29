provider "aws" {
  region = var.region
}

# VPC resource
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        Name = "${var.name}-vpc"
    }
}