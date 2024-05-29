# Internet Gateway resource
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
        Name = "${var.name}-igw"
    }
}

# # Allocate ElasticIPs
# resource "aws_eip" "my_eip" {
#   count = var.private_subnet_config["count"][0]
#   domain = "vpc"
# }

# # NAT Gateway for public subnet
# resource "aws_nat_gateway" "ngw" {
#   count = var.private_subnet_config["count"][0]
#   subnet_id = aws_subnet.public[count.index].id
#   allocation_id = aws_eip.my_eip[count.index].id

#   tags = {
#     Name = "${var.name}-ngw-${count.index + 1}"
#   }
# }
