resource "aws_eip" "nat_eip_az_1" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_az_1" {
  allocation_id = aws_eip.nat_eip_az_1.id
  subnet_id     = aws_subnet.public_subnet_az_1_1.id
  tags = {
    Name = "${var.vpc_name}-nat-public1-${var.az_1}"
  }
}

resource "aws_eip" "nat_eip_az_2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_az_2" {
  allocation_id = aws_eip.nat_eip_az_2.id
  subnet_id     = aws_subnet.public_subnet_az_2_2.id
  tags = {
    Name = "${var.vpc_name}-nat-public2-${var.az_2}"
  }
}

