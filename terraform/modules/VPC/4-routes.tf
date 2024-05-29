# # AZa: Private Route Table resource
# resource "aws_route_table" "private" {
#   count   = var.private_subnet_config["count"][0]
#   vpc_id  = aws_vpc.my_vpc.id

#     route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.ngw[count.index].id
#   }

#   tags = {
#         Name  = "${var.name}-private-rtb-${count.index + 1}"
#   }
# }

# # Associate the Private Routes Table with the Subnets
# resource "aws_route_table_association" "private_association" {
#   count           = var.private_subnet_config["count"][0]
#   subnet_id       = aws_subnet.private[count.index].id
#   route_table_id  = aws_route_table.private[count.index].id
# }

/****************
      PUBLIC
****************/

# Public Route Table resource
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  # Route for IPv4 traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
        Name = "${var.name}-public-rtb"
  }
}

# Associate the Route Table with the public subnets
resource "aws_route_table_association" "public_association" {
  count          = var.public_subnet_config["count"][0]
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}