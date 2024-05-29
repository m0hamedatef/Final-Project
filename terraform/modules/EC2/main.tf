# AMI Source
data "aws_ami" "aws_image_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
  }
}

# Key Pair
resource "aws_key_pair" "my_key_pair" {
  count = var.ec2_config["count"][0]
  key_name   = "${var.name}-key-pair"
  public_key = var.ec2_config["public_key"][count.index]
}

# Public Instances Resource
resource "aws_instance" "public" {
  count = var.ec2_config["count"][0]

  ami = data.aws_ami.aws_image_latest.id
  instance_type = var.ec2_config["type"][count.index]
  subnet_id = var.public_subnet_ids[count.index]
  security_groups = [ var.public_instance_sg_id ]
  key_name = aws_key_pair.my_key_pair[count.index].key_name
  
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}-${var.ec2_config["name"][count.index]}-${count.index}"
  }
}
