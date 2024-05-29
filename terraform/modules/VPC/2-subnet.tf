# # Private Subnets resource
# resource "aws_subnet" "private" {
#       count = var.private_subnet_config["count"][0]
#       vpc_id = aws_vpc.my_vpc.id
#       cidr_block = var.private_subnet_config["CIDRs"][count.index]
#       availability_zone = var.private_subnet_config["AZs"][count.index]

#       tags = {
#         Name = "${var.name}-private-subnet-${count.index + 1}"
#       }
# }

# Public Subnets resource
resource "aws_subnet" "public" {
      count                   = var.public_subnet_config["count"][0]
      vpc_id                  = aws_vpc.my_vpc.id
      cidr_block              = var.public_subnet_config["CIDRs"][count.index]
      availability_zone       = var.public_subnet_config["AZs"][count.index]
      map_public_ip_on_launch = true 

      tags = {
        Name = "${var.name}-public-subnet-${count.index + 1}"
        "kubernetes.io/cluster/${var.name}_eks_cluster" = "shared"
        "kubernetes.io/role/elb" = 1
      }
}