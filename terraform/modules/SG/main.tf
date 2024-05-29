# Private LoadBalancer Security Group resource
resource "aws_security_group" "private_lb_sg" {
  vpc_id = var.vpc_id

  name = "${var.name}-private-lb-sg"
  description = "This is a sec group for load-balancer to allow all traffic"

  # Ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public LoadBalancer Security Group resource
resource "aws_security_group" "public_lb_sg" {
  vpc_id = var.vpc_id

  name = "${var.name}-public-lb-sg"
  description = "This is a sec group for load-balancer to allow all traffic"

  # Ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*********************
      INSTANCES
**********************/

# Private Instances Security Group resource
resource "aws_security_group" "private_instance_sg" {
  vpc_id = var.vpc_id

  name = "${var.name}-private-instance-sg"
  description = "This is a sec group for apache server instances to allow all traffic"

  # Ingress rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public Instances Security Group resource
resource "aws_security_group" "public_instance_sg" {
  vpc_id = var.vpc_id

  name = "${var.name}-public-instance-sg"
  description = "This is a sec group for public instances to allow all traffic"

  # Ingress rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}